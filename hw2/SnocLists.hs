module SnocLists where

data SList a = Snil | Scons (SList a) a
 -- deriving Show

sappend :: SList a -> SList a -> SList a
sappend x Snil = x
sappend x (Scons t h) = Scons (sappend x t) h

smap :: (a -> b) -> SList a -> SList b
smap f Snil = Snil
smap f (Scons t h) = Scons (smap f t) (f h)

sconcat :: SList (SList a) -> SList a
sconcat Snil = Snil
sconcat (Scons t h) = sappend (sconcat t) h

toSlist :: [a] -> SList a 
toSlist [] = Snil
toSlist ( x : xs) = Scons ( toSlist (xs)) x

toList :: SList a -> [a]
toList (Scons Snil  h)= [h]
toList (Scons t h ) = [h] ++  toList( t)

helper :: SList a -> a
helper ( Scons Snil h)  = h
helper (Scons t h) = h
  
showSlist :: Show a => SList a -> String
showSlist x = show ( toList x)

instance Show a => Show (SList a) where
  show l = showSlist l
