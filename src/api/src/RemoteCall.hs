{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE DataKinds #-}

module RemoteCall
    ( readVal
    , writeVal
    )
where

import           Control.Lens
import           Control.Monad.IO.Class         ( liftIO )
import           Data.Maybe                     ( fromMaybe )
import           Data.ProtoLens.Message         ( defMessage )
import qualified Data.Text                     as T
import           Network.GRPC.Client
import           Network.GRPC.Client.Helpers
import           Network.HTTP2.Client
import           Proto.Rpc
import           Proto.Rpc_Fields
import           AppState

mkConf :: HostName -> PortNumber -> GrpcClientConfig
mkConf host port = baseConf { _grpcClientConfigCompression = uncompressed
                            , _grpcClientConfigTimeout     = Timeout 10
                            }
    where baseConf = grpcClientConfigSimple host port False

readVal :: AppStateRef -> T.Text -> IO (Either ClientError (Maybe T.Text))
readVal ref k = runClientIO inner
  where
    inner = do
        lead <- liftIO $ getCurrentLeader ref
        grpc <- setupGrpcClient (mkConf lead 31497)
        ret  <- rawUnary (RPC :: RPC GoKV "readKVRPC")
                         grpc
                         (defMessage & key .~ k)
        (liftIO . print) ret
        case (ret ^? unaryOutput) of
            Nothing   -> return Nothing
            Just resp -> return $ (resp ^? value)

writeVal
    :: AppStateRef -> T.Text -> T.Text -> IO (Either ClientError (Maybe Bool))
writeVal ref k v = runClientIO inner
  where
    inner = do
        lead <- liftIO $ getCurrentLeader ref
        grpc <- setupGrpcClient (mkConf lead 31497)
        ret  <- rawUnary (RPC :: RPC GoKV "writeKVRPC")
                         grpc
                         (defMessage & key .~ k & value .~ v)
        (liftIO . print) ret
        case (ret ^? unaryOutput) of
            Nothing   -> return Nothing
            Just resp -> return $ (resp ^? success)
