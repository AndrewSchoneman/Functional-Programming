{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_parsing1 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\Skones\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\Skones\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.0.2\\parsing1-0.1.0.0-8VLbjECDO26L4OzaBvKnsM"
dynlibdir  = "C:\\Users\\Skones\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.0.2"
datadir    = "C:\\Users\\Skones\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-8.0.2\\parsing1-0.1.0.0"
libexecdir = "C:\\Users\\Skones\\AppData\\Roaming\\cabal\\parsing1-0.1.0.0-8VLbjECDO26L4OzaBvKnsM"
sysconfdir = "C:\\Users\\Skones\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "parsing1_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "parsing1_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "parsing1_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "parsing1_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "parsing1_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "parsing1_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)
