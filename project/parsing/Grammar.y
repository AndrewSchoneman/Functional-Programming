{
module Grammar where
import Tokens
import Expr
}

%name parseExpr
%tokentype { Token }
%error { parseError }

%token
    var { TokenSym $$ }
    '(' { TokenLeftParen }
    ')' {TokenRightParen }
    ',' { TokenComma }
    '@' { TokenAt }
    '$' { TokenDollar }



%%

Exp :
'(' Exp ')'      {()}
| Exp','Exp    {()}
| '(' Exp','Exp ')' {()}
| '(' Exp',' '(' Exp ')' ')' {()}
| '(' '('Exp ')'',' Exp ')' {()}
| '(' '(' Exp ')'',' '('Exp')' ')' {()}
 
|  var           {()}


{

parseError :: [Token] -> a
parseError tks = error ("Parse error: " ++ show tks)

}
