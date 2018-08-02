module Main where

import Basics
import Data.List
import Intermediate
import Challenge
import SnocLists
import Data.Tree
import HeadClass
import Expr

newtype ATree a = ATree (Tree a)

printShowable :: Show a => a -> IO ()
printShowable l =
  do
    putStrLn $ show $ l

testList1 :: [[[Integer]]]
testList1 = [[[1,2,3,4],[10,9,8]],[[1],[2]]]

testTree1a :: Tree Integer
testTree1a = (Node 3 [ Node 4 [] , Node 5 [ Node 6 []  ]])

testTree1b :: Tree Integer
testTree1b = (Node 8 [ Node 8 [] , Node 9 [ ] , Node 10 [] ])

testTree1 :: Tree (Tree Integer)
testTree1 = (Node testTree1a [ Node testTree1b [] ])

testExpr :: Expr
testExpr = Div (Add (Num 3) (Mult (Num 4) (Num 5)))

main :: IO ()
main =
  do
    putStrLn "---------------------------------------------------"
    putStrLn "Basics:"
    putStrLn ""
--uncomment when you do the first problem in BasicsSol:

    printShowable $ map2 (*10) (Prelude.head testList1)
    printShowable $ map3 (*10) testList1
    printShowable $ mapTree2 (*10) testTree1
    print2 15 20
    printShowable $ evalExplicit testExpr 6
    putStrLn "---------------------------------------------------"
    putStrLn "Intermediate"
    putStrLn ""
-- uncomment when you define fmap2:
    printShowable $ fmap2 (*10) (Just (Just 33))

    putStrLn $ show $ Scons (Scons (Scons Snil 4) 5) 6
    printShowables $ ["hi" , "bye", "ok"]
    putStrLn "---------------------------------------------------"
    printShowable $ postorder testTree1a
    printShowable $ evalImplicit testExpr 6
