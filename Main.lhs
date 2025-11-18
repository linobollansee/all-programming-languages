-- Haskell module
module Main (main) where

main :: IO ()
main = putStrLn "Hello, World!"

greet :: String -> String
greet name = "Hello, " ++ name ++ "!"
