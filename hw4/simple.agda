open import lib

postulate
  A : Set
  a : A
  b : A
  c : A
  d : A    
  f : A → A
  g : A → A → A
  h : A → A → A
  p : a ≡ b
  q : b ≡ c
  r : f a ≡ a
  s : ∀ x y → g y x ≡ h x x
  t : ∀ x → f x ≡ x → g x x ≡ x
  u : h (f d) (f d) ≡ f d

lemma0 : c ≡ c
lemma0  = refl


lemma1 : c ≡ a
lemma1    rewrite p | q =  refl

lemma1a : b ≡ a
lemma1a rewrite p = refl

lemma2 : f b ≡ b
lemma2  rewrite lemma1a  = ?



lemma3 : g b (f (f a)) ≡ h a a
lemma3 rewrite r | r  = s a b






lemma4 : f (f d) ≡ (f d) → g a (f d) ≡ f d
lemma4 x rewrite  s ( f d ) a  = u 



