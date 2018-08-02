{
module Tokens where
}

%wrapper "basic"

$digit = 0-9
$alpha = a-z
$beta = A-Z
tokens :-

  $white+                       ;
  "--".*                        ;
  "@"		       { \s -> TokenAt }
  "$"		       { \s -> TokenDollar }
  "(" 		       { \s -> TokenLeftParen}
  ")" 		       { \s -> TokenRightParen}
  ","		       { \s-> TokenComma}
 $alpha [$alpha $digit \_ \']* { \s -> TokenSym s }

{

-- The token type:
data Token = TokenAt
           | TokenDollar
           | TokenSym String
           | TokenComma
           | TokenLeftParen
           | TokenRightParen
           deriving (Eq,Show)

scanTokens = alexScanTokens

}
