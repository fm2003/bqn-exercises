inp ← "a,b,c,d
12,f,g,h
i,j,k,l"

[c,n] ← ⟨',',@+10⟩=⌜inp
s ← n∨c
p ← ⟨∘,1++´(n⊐1)↑s⟩⥊(¯1¨⌾(s⊸/)+`s) ⊔ inp
h ← ⥊1↑p
t ← ⍉1↓p
[aa,bb,cc,dd] ← t⊏˜h⊐⟨"a","b","c","d"⟩
•Show aa
