module SnocLists where

import Data.List


data SList a = Snil | Scons (SList a) a
  deriving Show


-- helper to create  nested lists
nList :: a -> SList a -> SList(SList a)
nList i (Scons Snil h) = Snil
nList i (Scons h t) = Scons ( Scons ( nList i h) h) h

--twoList :: SList a -> Slist a -> SList(SList a)



sappend :: SList a -> SList a -> SList a
sappend Snil y = y
sappend (Scons t h) y =  Scons (sappend t y) h
--sappend = undefined

slength :: SList a -> Int
slength Snil = 0
slength (Scons t h ) = 1 + slength t
--slength SList = 1
--slength = undefined

smap :: (a -> b) -> SList a -> SList b
smap _ Snil = Snil
smap f (Scons xs x) = Scons  (smap ( f ) xs) (f x)

stail :: SList a -> a
stail (Scons Snil h) = h
stail (Scons t h) = stail t

shead :: SList a -> a
shead (Scons t h) = h


sfilter :: (a -> Bool) -> SList a -> SList a
sfilter _pred Snil = Snil
sfilter pred (Scons t h)
  | pred h = Scons (sfilter pred t) h
  | otherwise = sfilter pred t

sintersperse :: a -> SList a -> SList a
sintersperse _ Snil = Snil
sintersperse a (Scons t h) = Scons ( pintersperse a t) h

--helper function for sintersperse
pintersperse :: a -> SList a -> SList a
pintersperse _ Snil = Snil
pintersperse a (Scons t h) = Scons ( Scons ( pintersperse a t) h ) a

sbuild :: a -> SList a
sbuild a = Scons Snil a



-- given a list of lists l1 ... lk , return the concatenation of l1 through lk.
sconcat :: SList (SList a) -> SList a
sconcat Snil = Snil
sconcat (Scons Snil h) = h
sconcat (Scons t h) = sappend h (sconcat t)
--sconcat (Scons t h) = soncat ( 

--sconcat x= 
--sconcat xs =  Scons (\c n -> foldr (\x y -> foldr x y x) n xs)

data IntList = IntListNil | IntListCons Int IntList
  deriving Show

intListLength :: IntList -> Int
intListLength IntListNil = 0
intListLength (IntListCons h t) = 1 + intListLength t

intListAppend :: IntList -> IntList -> IntList
intListAppend IntListNil y = y
intListAppend (IntListCons h t) y = IntListCons h (intListAppend t y)
