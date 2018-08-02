module BoolK where

data BoolK = TrueK | FalseK | UnknownK

notK :: BoolK -> BoolK
notK TrueK = FalseK
notK FalseK = TrueK
notK UnknownK = UnknownK

andK :: BoolK -> BoolK -> BoolK
andK FalseK _ = FalseK
andK TrueK x = x
andK UnknownK FalseK = FalseK
andK UnknownK _ = UnknownK

orK :: BoolK -> BoolK -> BoolK
orK TrueK _ = TrueK
orK FalseK x = x
orK _ TrueK = TrueK
orK x FalseK = x
orK UnknownK UnknownK = UnknownK

equivK :: BoolK -> BoolK -> BoolK
equivK TrueK TrueK = TrueK
equivK TrueK FalseK = FalseK
equivK FalseK FalseK = TrueK
equivK FalseK TrueK = FalseK
equivK UnknownK _ = UnknownK
equivK _ UnknownK = UnknownK



exclusiveOrK :: BoolK -> BoolK -> BoolK
exclusiveOrK TrueK TrueK = FalseK
exclusiveOrK FalseK FalseK = FalseK
exclusiveOrK TrueK FalseK = TrueK
exclusiveOrK FalseK TrueK = TrueK
exclusiveOrK UnknownK _ = UnknownK
exclusiveOrK _ UnknownK = UnknownK

showBoolK :: BoolK -> String
showBoolK UnknownK = "unknown"
showBoolK TrueK = "true"
showBoolK FalseK = "false"

instance Show BoolK where
  show = showBoolK
