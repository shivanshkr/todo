module Main where

import System.IO
import System.Directory
import Data.Char
import Data.List



main :: IO ()
main = do
  handle <- openFile "todo.txt" ReadWriteMode
  (temppath , temphandle ) <- openTempFile "." "temp"
  content <- hGetContents handle
  let linecontent = lines content
  let numbcontent content = unlines $ zipWith (\dat n -> show n ++" " ++ dat ) (linecontent) [0..]
  putStrLn $ numbcontent content
  putStrLn "enter the number you want to delete ?? "
  numberstring <- getLine
  let number = read numberstring
      newdoto = delete (linecontent !! number ) linecontent
  hClose handle
  hClose temphandle
  writeFile temppath $ unlines newdoto
  removeFile "todo.txt"
  renameFile temppath "todo.txt"
