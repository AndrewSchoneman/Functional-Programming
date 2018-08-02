open import lib

data mmList (S : string) : Set where
  mkMmList : ∀(ss : 𝕃 string)(b : 𝔹) → b ≡ list-member _=string_ S ss → mmList S


mmList-member : ∀{S : string} → string → mmList S → 𝔹
mmList-member {S} a (mkMmList ss tt x) = tt
mmList-member {S} a (mkMmList ss ff x) = ff

-- just can't figure out how these automatic proofs work
_::mmList_ : ∀{S : string} → string → mmList S → mmList S
_::mmList_  {S} str (mkMmList x b p) with ( p )
_::mmList_ {S} str (mkMmList x tt px) | p  = (mkMmList ([ str ] ++ x) tt {!!})
_::mmList_ {S} str (mkMmList x ff px) | p = (mkMmList ([ str ] ++ x) ff {!!})



_++mmList_ : ∀{S : string} → mmList S → mmList S → mmList S
(mkMmList xs bx x) ++mmList (mkMmList ys by y)  =  mkMmList (xs ++ ys) tt {!!}
-- _++mmList_ {_} (mkMmList _ ff _) (mkMmList _ tt _) = {!!} 
-- _++mmList_ {_} (mkMmList _ _ _) (mkMmList _ ff _) = {!!}


mmList-member++ : ∀{S : string}(s : string)(m1 m2 : mmList S) →
                  mmList-member s (m1 ++mmList m2) ≡ (mmList-member s m1 || mmList-member s m2) 
mmList-member++ a (mkMmList ss b x) = {!!}



{-

filter𝕍 : ∀{A : Set}{n : ℕ} → (A → 𝔹) → 𝕍 A n → Σ ℕ (λ m → m ≤ n ≡ tt ∧ 𝕍 A m)
filter𝕍  {n = zero } f []  = ( 0 , refl  , []  )
filter𝕍 n ( x :: [] ) = if n x then ( 1 , refl , x :: [] ) else (0 ,  refl , [] )
filter𝕍  n ( x :: xs) with n x
filter𝕍 {_} {m}  n ( x :: xs ) | tt  = ( m , ≤suc₈ m ,  x :: xs )
filter𝕍  {_} { m} n ( x :: xs ) | ff = ( pred m , ≤sucₓ m  , xs )

-}
