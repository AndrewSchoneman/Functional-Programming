open import lib

-- Types




-n : ∀ (x : ℕ) → x ∸ x ≡ 0
-n zero = refl
-n (suc x) rewrite -n x = refl

-z : ∀ ( x : ℕ ) → (0 ∸ (0 ∸ suc x)) ≡ 0
-z zero =  refl
-z (suc n) rewrite -z n = refl

init𝕍 : ∀{A : Set}{n : ℕ} → 𝕍 A (suc n) → 𝕍 A n
init𝕍  ( x :: [] )   = []  
init𝕍  ( x :: x' :: xs  ) = x :: init𝕍 ( x' :: xs )

last𝕍 : ∀{A : Set}{n : ℕ} → 𝕍 A (suc n) → A
last𝕍 ( x :: [] ) = x
last𝕍 ( x :: x' :: xs ) = last𝕍 ( x' :: xs )




≤sucₓ : ∀ (n : ℕ ) → pred (suc n) < suc n || pred (suc n) =ℕ suc n ≡ tt
≤sucₓ zero = refl
≤sucₓ (suc x) rewrite ≤sucₓ x = refl

≤suc₈ : ∀ ( n : ℕ ) → suc n < suc n || suc n =ℕ suc n ≡ tt
≤suc₈ zero = refl
≤suc₈ (suc x) rewrite ≤suc₈ x = refl

filter𝕍 : ∀{A : Set}{n : ℕ} → (A → 𝔹) → 𝕍 A n → Σ ℕ (λ m → m ≤ n ≡ tt ∧ 𝕍 A m)
filter𝕍  {n = zero } f []  = ( 0 , refl  , []  )
filter𝕍 n ( x :: [] ) = if n x then ( 1 , refl , x :: [] ) else (0 ,  refl , [] )
filter𝕍  n ( x :: xs) with n x
filter𝕍 {_} {m}  n ( x :: xs ) | tt  = ( m , ≤suc₈ m ,  x :: xs )
filter𝕍  {_} { m} n ( x :: xs ) | ff = ( pred m , ≤sucₓ m  , xs )



{-
∸suc2 : ∀ {x y z : ℕ } → y < x ≡ tt → x ∸ ((suc z) + y) < x ∸ y ≡ tt
∸suc2{x}{y}{z} p rewrite +comm (suc z) y = ∸suc{x}{y}{z} p
-}


2n-1 : ℕ → ℕ
2n-1 0 = 0
2n-1 1 = 1
2n-1 (suc (suc n)) = suc (suc (2n-1 (suc n)))

intersperse𝕍 : ∀{A : Set}{n : ℕ} → A → 𝕍 A n → 𝕍 A (2n-1 n)
intersperse𝕍  x []  = []
intersperse𝕍 {n = 1} x ( x' :: [])  = x' :: []
intersperse𝕍 x ( x' :: xs :: xss ) = x' :: x :: intersperse𝕍 x ( xs :: xss) 



take𝕍 : ∀{A : Set}{n : ℕ} → (m : ℕ) → 𝕍 A n → m ≤ n ≡ tt → 𝕍 A (m)
take𝕍   zero (x :: xs) p = []
take𝕍 {_} {._} zero [] _ = []
take𝕍  (suc m) (x :: xs) p  = x :: take𝕍 m  xs p
take𝕍  (suc n ) [] () 




take𝕍' : ∀{A : Set}{n : ℕ} → (m : ℕ) → 𝕍 A n → 𝕍 A (m ⋃ n)
take𝕍'   zero (x :: xs) p = []
take𝕍' {_} {._} zero [] _ = []
take𝕍'  (suc m) (x :: xs) p  = x :: take𝕍 m  xs p




{- 

*0 : ∀ (x : ℕ) → x * 0 ≡ 0
*0 zero = refl
*0 (suc x) rewrite *0 x = refl

0∸ : ∀ {x : ℕ} → 0 ∸ x ≡ 0
0∸{0} = refl
0∸{suc x} = refl

take : ∀{A : Set} → ℕ → 𝕃 A → 𝕃 A
take zero x =  []
take (suc n) [] = []
take (suc n) ( x :: x') = x :: take  n x' 

splitAt : ∀ {a} {A : Set a} m {n} (xs : Vec A (m + n)) →
          ∃₂ λ (ys : Vec A m) (zs : Vec A n) → xs ≡ ys ++ zs
splitAt zero    xs                = ([] , xs , refl)
splitAt (suc m) (x ∷ xs)          with splitAt m xs
splitAt (suc m) (x ∷ .(ys ++ zs)) | (ys , zs , refl) =
  ((x ∷ ys) , zs , refl)

[_]𝕍 : ∀ {ℓ} {A : Set ℓ} → A → 𝕍 A 1
[ x ]𝕍 = x :: []

_++𝕍_ : ∀ {ℓ} {A : Set ℓ}{n m : ℕ} → 𝕍 A n → 𝕍 A m → 𝕍 A (n + m)
[]        ++𝕍 ys = ys
(x :: xs) ++𝕍 ys = x :: xs ++𝕍 ys

head𝕍 : ∀ {ℓ} {A : Set ℓ}{n : ℕ} → 𝕍 A (suc n) → A
head𝕍 (x :: _) = x

tail𝕍 : ∀ {ℓ} {A : Set ℓ}{n : ℕ} → 𝕍 A n → 𝕍 A (pred n)
tail𝕍 [] = []
tail𝕍 (_ :: xs) = xs

map𝕍 : ∀ {ℓ ℓ'} {A : Set ℓ} {B : Set ℓ'}{n : ℕ} → (A → B) → 𝕍 A n → 𝕍 B n
map𝕍 f []       = []
map𝕍 f (x :: xs) = f x :: map𝕍 f xs

concat𝕍 : ∀{ℓ}{A : Set ℓ}{n m : ℕ} → 𝕍 (𝕍 A n) m → 𝕍 A (m * n)
concat𝕍 [] = []
concat𝕍 (x :: xs) = x ++𝕍 (concat𝕍 xs)

nth𝕍 : ∀ {ℓ} {A : Set ℓ}{m : ℕ} → (n : ℕ) → n < m ≡ tt → 𝕍 A m → A
nth𝕍 0 _ (x :: _) = x
nth𝕍 (suc n) p (_ :: xs) = nth𝕍 n p xs
nth𝕍 (suc n) () []
nth𝕍 0 () []

member𝕍 : ∀{ℓ}{A : Set ℓ}{n : ℕ}(eq : A → A → 𝔹)(a : A)(l : 𝕍 A n) → 𝔹
member𝕍 eq a [] = ff
member𝕍 eq a (x :: l) = if (eq a x) then tt else (member𝕍 eq a l)

repeat𝕍 : ∀ {ℓ} {A : Set ℓ} → (a : A)(n : ℕ) → 𝕍 A n
repeat𝕍 a 0 = []
repeat𝕍 a (suc n) = a :: (repeat𝕍 a n)

foldl𝕍 : ∀{ℓ ℓ'}{A : Set ℓ}{B : Set ℓ'} → B → (B → A → B) → {n : ℕ} → 𝕍 A n → 𝕍 B n
foldl𝕍 b _f_ [] = []
foldl𝕍 b _f_ (x :: xs) = let r = (b f x) in r :: (foldl𝕍 r _f_  xs)

zipWith𝕍 : ∀ {ℓ ℓ' ℓ''} {A : Set ℓ}{B : Set ℓ'}{C : Set ℓ''} → 
           (A → B → C) → {n : ℕ} → 𝕍 A n → 𝕍 B n → 𝕍 C n
zipWith𝕍 f [] [] = []
zipWith𝕍 _f_ (x :: xs) (y :: ys) = (x f y) :: (zipWith𝕍 _f_ xs ys)

-- helper function for all𝕍
allh𝕍 : ∀ {ℓ} {A : Set ℓ}{n : ℕ}(p : ℕ → A → 𝔹) → 𝕍 A n → ℕ → 𝔹
allh𝕍 p [] n = tt
allh𝕍 p (x :: xs) n = p n x && allh𝕍 p xs (suc n)

-- given a predicate p which takes in an index and the element of 
-- the given 𝕍 at that index, return tt iff the predicate
-- returns true for all indices (and their elements).
all𝕍 : ∀ {ℓ} {A : Set ℓ}{n : ℕ}(p : ℕ → A → 𝔹) → 𝕍 A n → 𝔹
all𝕍 p v = allh𝕍 p v 0

𝕍-to-𝕃 : ∀ {ℓ} {A : Set ℓ}{n : ℕ} → 𝕍 A n → 𝕃 A
𝕍-to-𝕃 [] = []
𝕍-to-𝕃 (x :: xs) = x :: (𝕍-to-𝕃 xs)

𝕃-to-𝕍 : ∀ {ℓ} {A : Set ℓ} → 𝕃 A → Σ ℕ (λ n → 𝕍 A n)
𝕃-to-𝕍 [] = (0 , [])
𝕃-to-𝕍 (x :: xs) with 𝕃-to-𝕍 xs
... | (n , v) = (suc n , x :: v)

{- turn the given 𝕍 into a string by calling f on each element, and separating the elements
   with the given separator string -}
𝕍-to-string : ∀ {ℓ} {A : Set ℓ}{n : ℕ} → (f : A → string) → (separator : string) → 𝕍 A n → string
𝕍-to-string f sep v = 𝕃-to-string f sep (𝕍-to-𝕃 v)
-}
