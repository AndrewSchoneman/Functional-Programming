module Intermediate where

-- define fmap2
fmap2 :: (Functor f, Functor g)=> ( a -> b) -> f ( g a) -> f (g b)
fmap2 = fmap . fmap
--fmap2 f g = (\x -> f ( g x))
----------------------------------------------------------------------

printShowables :: Show a => [a] -> IO ()
printShowables []  = return()
printShowables (x : xs) = putStrLn (show x) >> printShowables (xs)
