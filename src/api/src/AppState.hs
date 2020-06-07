module AppState
    ( AppState
    , AppStateRef
    , newState
    , getCurrentLeader
    , setCurrentLeader
    )
where

import           System.Environment
import           Control.Monad.IO.Class
import           Data.IORef

data AppState = AppState {currentLeader :: String}
type AppStateRef = IORef AppState

newState :: IO AppStateRef
newState = do
    nodeZero <- getEnv "RAFT_NODE_0"
    newIORef $ AppState nodeZero

getCurrentLeader :: AppStateRef -> IO String
getCurrentLeader ref = do
    s <- readIORef ref
    return (currentLeader s)

setCurrentLeader :: AppStateRef -> String -> IO ()
setCurrentLeader ref newLeader =
    atomicModifyIORef ref (\s -> (s { currentLeader = newLeader }, ()))
