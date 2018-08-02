
module Basics where

import HeadClass
import Data.Tree
import SnocLists
import Expr

-- declare Tree to be an instance of HeadClass.Head
instance Head Tree where
  head (Node h l ) = h

-- declare SList to be an instance of Functor
instance Functor SList where
  fmap f Snil = Snil
  fmap f (Scons xs x) = Scons  (smap ( f ) xs) (f x)


map2 :: (a -> b) -> [[a]] -> [[b]]
map2 f [] = []
map2 f xs = map( \x -> map f x)  xs


  
map3 :: (a -> b) -> [[[a]]] -> [[[b]]]
map3 f [] = []
map3 f xs = map( \x  -> map2 f x) xs

mapTree :: (a -> b) -> Tree a -> Tree b
mapTree f (Node x ts) = Node (f x) (map (mapTree f) ts)

mapTree2 :: (a -> b) -> Tree (Tree a) -> Tree (Tree b)
mapTree2 f xs = mapTree ( \x -> mapTree f x) xs

print2 :: Show a => a -> a -> IO ()
print2 a1 a2 = putStrLn((show a1) ++ " " ++ (show a2))

----------------------------------------------------------------------

evalExplicit :: Expr -> Integer -> Integer
evalExplicit (Num a) b = a
evalExplicit (Div  a) b =  quot (evalExplicit a b) b
evalExplicit (Add e1 e2) b = (evalExplicit(e1) b) + (evalExplicit(e2) b)
evalExplicit (Mult  e1 e2) b = (evalExplicit(e1) b) * (evalExplicit(e2) b)


--testExpr :: Expr
--testExpr = Add (Num 3) (Mult (Num 4) (Num 5))

--eval :: Expr -> Integer
--eval (Num x) = x
--eval (Add e1 e2) = (eval e1) + (eval e2)
--eval (Mult e1 e2) = (eval e1) * (eval e2)
