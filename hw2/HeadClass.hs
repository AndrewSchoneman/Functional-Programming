module HeadClass where

{- class for type ctors t :: * -> * , which have a head method, that should
   return the first piece of data in a "t a" data structure -}
class Head t where
  head :: t a -> a

