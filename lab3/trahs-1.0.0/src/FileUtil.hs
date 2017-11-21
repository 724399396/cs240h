import           Codec.Digest.SHA
import           Control.Applicative
import qualified Data.ByteString.Lazy as L
import System.Posix.Files

hashFile :: FilePath -> IO String
hashFile path = showBSasHex <$> (hash SHA256 <$> L.readFile path)

ignoreFile :: [FilePath]
ignoreFile = [".trahs.db", ".trahs.db~"]

isFile :: FilePath -> Bool
isFile = isRegularFile . getSymbolicLinkStatus

isFileChange :: History -> FilePath -> Bool
isFileChange (name,modifyTime,md5) fp =
  if (modificationTime fp == modifyTime)
  then True
  else False
