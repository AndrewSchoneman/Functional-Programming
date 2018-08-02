module Expr where

data Expr = Num Integer | Add Expr Expr | Mult Expr Expr | Div Expr
