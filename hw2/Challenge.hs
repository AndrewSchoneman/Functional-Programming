module Challenge where

import SnocLists
import Data.Tree
import Expr


backwards :: Tree a -> [a]
backwards t = squish t []
  where squish (Node x ts) xs =  (foldr squish xs ts) ++ [x]

postorder :: Tree a -> SList a
postorder a = toSlist (reverse (piatn a))


postOrder :: Tree a  -> [a]
postOrder (Node a [] ) = [a]
postOrder (Node a ( x : [])) = postOrder x ++ [a]
postOrder (Node a (x : (x' : [xs])))  = postOrder x ++ postOrder x' ++ postOrder xs++ [a]
postOrder (Node a (x : [xs])) = postOrder x ++ flattens([postOrder(b) | b <- [xs]]) ++ [a]


newtype Q a = Q {unQ :: Integer -> a}

readQ :: Q Integer
readQ = Q id

instance Functor Q where
  fmap f (Q g) = Q (f . g)

instance Applicative Q where
  pure a = Q (\ x -> a)
  (Q f) <*> (Q a) = Q (\ x -> f x (a x))

evalImplicit :: Expr -> Integer -> Integer
evalImplicit e d = undefined


  


flattens :: [[a]] -> [a]         
flattens xs = (\z n -> foldr (\x y -> foldr z y x) n xs) (:) []

piatn :: Tree a -> [a]
piatn (Node a []) = [a]
piatn (Node a b) =  flattens([postOrder(x) | x<-b]) ++ [a]

