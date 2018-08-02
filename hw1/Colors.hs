module Colors where

data Primary = Yellow | Red | Blue
  deriving Show

data Secondary = Orange | Purple | Green 
  deriving Show

mixDifferent :: Primary -> Primary -> Secondary
mixDifferent Yellow Red = Orange
mixDifferent Red Yellow = Orange
mixDifferent Blue Yellow = Green
mixDifferent Yellow Blue = Green
mixDifferent Blue Red = Purple
mixDIfferent Red Blue = Purple

areComplementary :: Primary -> Secondary -> Bool
areComplementary Red Green = True
areComplementary Red Purple = False
areComplementary Red Orange = False
areComplementary Blue Orange = True
areComplementary Blue Green = False
areComplementary Blue Purple = False
areComplementary Yellow Purple = True
areComplementary Yellow Orange = False
areComplementary Yellow Green = False

complementPrimary :: Primary -> Secondary
complementPrimary Red = Green
complementPrimary Blue = Orange
complementPrimary Yellow = Purple

complementSecondary :: Secondary -> Primary
complementSecondary Green = Red
complementSecondary Orange = Blue
complementSecondary Purple = Yellow

constituents :: Secondary -> (Primary , Primary)
constituents Orange  = (Yellow, Red)
constituents Purple = (Red, Blue)
constituents Green = (Yellow, Blue)

