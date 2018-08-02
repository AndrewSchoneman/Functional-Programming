module Intermediate where

import Control.Monad.State.Lazy
import Data.Tree

prefixOrder :: Ord a => Tree a -> State a [a]
prefixOrder t =
  do
    z <- get
    let x =  testfix t
    let y =  maximum x
    
    if z > y then put (z)
      else put y
    return (x) 
    
testTree = Node 3 [Node 4 [] , Node 8 [Node 6 [],Node 7[],Node 5[]]]
testTree2 = Node 3 [Node 4 [Node 59[Node 6969[], Node 11232[], Node 1111[]], Node 11[], Node 12[], Node 1231[], Node 2342 []] , Node 8 [Node 6 [],Node 7[],Node 5[]]]

testfix :: Tree a -> [a]
testfix ( Node a []) = [a]
testfix (Node a (x : [])) = [a] ++ testfix x
testfix (Node a (x :(x' : []))) = [a] ++ testfix x ++ testfix x'
testfix (Node a (x : ( x' : [xs]))) = [a] ++ testfix x ++  testfix x' ++ testfix xs
testfix (Node a (x : ( x' : xs : [xss]))) = [a] ++ testfix x ++  testfix x' ++ testfix xs ++ testfix xss
testfix (Node a (x : ( x' : xs : xss : [xsy]))) = [a] ++ testfix x ++  testfix x' ++ testfix xs ++ testfix xss ++ testfix xsy

--postOrder :: Tree a  -> [a]
--postOrder (Node a [] ) = [a]
--postOrder (Node a ( x : [])) = postOrder x ++ [a]
--postOrder (Node a (x : (x' : [xs])))  = postOrder x ++ postOrder x' ++ postOrder xs++ [a]
--postOrder (Node a (x : [xs])) = postOrder x ++ flattens([postOrder(b) | b <- [xs]]) ++ [a]
