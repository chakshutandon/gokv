{-# LANGUAGE OverloadedStrings, ScopedTypeVariables, DeriveGeneric #-}
module Main where

import           GHC.Generics
import           Web.Scotty
import           Control.Exception
import           Control.Monad
import           Control.Monad.IO.Class
import           Data.Aeson
import qualified Data.Text.Lazy                as T
import           Data.Maybe                     ( fromMaybe )
import           Data.Either                    ( fromRight )
import           Data.IORef
import           Network.HTTP2.Client.Exceptions
import           AppState
import           RemoteCall

failResponse :: T.Text -> ActionM ()
failResponse msg =
    Web.Scotty.json $ object ["success" .= False, "message" .= msg]

data WriteRequest = WriteRequest {
    key :: T.Text,
    value :: T.Text
} deriving (Generic, Show)

instance ToJSON WriteRequest
instance FromJSON WriteRequest

-- hacky...want to trigger the Left case below
exceptionHandler :: SomeException -> IO (Either ClientError a)
exceptionHandler _ = return (Left EarlyEndOfStream)

app :: AppStateRef -> ScottyM ()
app ref = do
    get "/get/:key" $ do
        (k :: T.Text) <- param "key"
        if k == ""
            then failResponse "No key provided"
            else do
                res <- liftIO
                    $ catch (readVal ref (T.toStrict k)) exceptionHandler

                case res of
                    Left  _        -> failResponse "Error connecting to node"
                    Right Nothing  -> failResponse "Key does not exist"
                    Right (Just t) -> Web.Scotty.json
                        $ object ["success" .= True, "value" .= t]

    post "/set" $ do
        (req :: WriteRequest) <- jsonData `rescue` (\_ -> next)

        res                   <- liftIO $ catch
            (writeVal ref ((T.toStrict . key) req) ((T.toStrict . value) req))
            exceptionHandler
        case res of
            Left  _           -> failResponse "Error connecting to node"
            Right (Just True) -> Web.Scotty.json $ object ["success" .= True]
            _                 -> failResponse "Unknown error"

    post "/set" $ failResponse "Invalid request (must include key and value)"

    get "/state" $ do
        res <- liftIO $ getCurrentLeader ref
        html $ T.pack res
    get "/" $ do
        setHeader "Content-Type" "text/html; charset=utf-8"
        file "app/index.html"

main :: IO ()
main = do
    ref <- newState
    scotty 3000 (app ref)
