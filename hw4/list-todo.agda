open import lib

take : ∀{A : Set} → ℕ → 𝕃 A → 𝕃 A
take zero x =  []
take (suc n) [] = []
take (suc n) ( x :: x') = x :: take  n x' 

intersperse : ∀{A : Set} → A → 𝕃 A → 𝕃 A
intersperse x []  = []
intersperse x ( xs :: [] ) = [ xs  ]

intersperse x ( x' :: x'' :: xs) = x' :: x :: intersperse x (x'' ::  xs)

length-take : ∀{A : Set}(n : ℕ)(xs : 𝕃 A) → length (take n xs) ≤ n ≡ tt
length-take zero x = refl
length-take (suc n) [] = refl
length-take  (suc n) (x :: xs)  = length-take n xs 


length-intersperse : ∀{ A : Set } ( p : A) ( l : 𝕃 A) → (length(l) * 2) ∸ 1  ≤ length( intersperse p l ) ≡ tt
length-intersperse p [] = refl
length-intersperse p ( x :: []) = refl
length-intersperse p ( x :: x' :: [] ) = refl
length-intersperse p (x :: x' :: xs) =  length-intersperse p ( x' :: xs)
{-
length-intersperse' : ∀{ A : Set } ( p : A) ( l : 𝕃 A) → length(l)  ≤  length( intersperse p l )  ≡ tt
length-intersperse' p [] = refl
length-intersperse' p ( x :: []) = refl
length-intersperse' p (x :: x₁ :: xs) = length-intersperse' p ( x₁ :: xs)
-}


