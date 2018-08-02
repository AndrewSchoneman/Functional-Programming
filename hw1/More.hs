module More where 


ascendings :: Ord a => [a] -> [[a]]
ascendings x = foldr f [] x where
  f x [] = [[x]]
  f x ( x' : xs) = if x < head x'
    then ( x : x') : xs
    else [x] : (x' : xs)
