module Basics where

import Control.Monad.State.Lazy
import System.Environment
import Control.Monad

prob11 :: IO [Integer]
prob11 =
  do
    putStrLn "prob1"
    return [1,2,3]

prob1 :: IO [Integer]
prob1 =  putStrLn "prob1"  >>= \x  -> return [1,2,3]

    
prob22 :: State Integer Integer
prob22 =
    get >>= (\ x -> 
    put (x + x) >> return 1)

prob2 :: State Integer Integer
prob2 =
  do
    x <- get
    put (x+x)
    return 1

type Sta s a = s -> (s,a)

prob3 :: Sta Integer Integer
prob3 s = (1, s+s)

reverseArgs :: IO [String]
reverseArgs =
  do
    line <- getArgs
    return (reverse line)


getFirstArgIf :: IO (Maybe String)
getFirstArgIf =
  do
    x <- getArgs
    return $ prs  x
 

prs :: [String] -> Maybe String
prs [] =  Nothing
prs (x : xs) = Just x


 
