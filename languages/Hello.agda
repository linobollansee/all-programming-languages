module Hello where

open import IO

main : Main
main = run (putStrLn "Hello, World!")