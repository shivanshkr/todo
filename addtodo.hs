module Main where

import System.IO
import Data.Char


main :: IO ()
main = do
--  content <- hGetContents handle
--  filename <- getLine
--  writeFile filename content
--  hClose handle
    text <- getLine
    appendFile "todo.txt" ( text ++ "\n" )
