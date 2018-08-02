module Main where

import Colors
import BoolK

primaries :: [Primary]
primaries = [ Yellow , Red , Blue ]

secondaries :: [Secondary]
secondaries = [Orange , Purple , Green ]

boolks :: [BoolK]
boolks = [ TrueK , FalseK , UnknownK ]

printList :: Show a => [a] -> IO ()
printList l =
  do
    putStrLn $ show $ l

main :: IO ()
main =
  do
    putStrLn "---------------------------------------------------"
    putStrLn "Colors:"
    putStrLn ""
    printList $ map constituents secondaries
    printList $ [ (x,y,areComplementary x y) | x <- primaries , y <- secondaries]
    printList $ [ (x,complementPrimary x) | x <- primaries]
    printList $ [ (x,complementSecondary x) | x <- secondaries]    
    putStrLn "---------------------------------------------------"
    putStrLn "Kleene booleans:"
    putStrLn ""
    printList $ [ (x,y,orK x y) | x <- boolks , y <- boolks ]
    printList $ [ (x,y,equivK x y) | x <- boolks , y <- boolks ]
    printList $ [ (x,y,exclusiveOrK x y) | x <- boolks , y <- boolks ]
    putStrLn "---------------------------------------------------"
