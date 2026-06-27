_st ← {1↓𝔽⟜»}

∧´ =_st -_st ∧ 3‿1‿7‿9‿5

RoundPos ← (·⌊0.5+⊢)⌾(10⊸×)  # round to nearest tenth, ties towards infinity
Round ← (××·⌊0.5+|)⌾(10⊸×)  # round to nearest tenth, ties away from zero
Round 3.149

# NoConnections ← (¬∘∊˜/⊢)˝·⍉>
NoConnections ← {
    [s, d] ← ⍉>𝕩
    (¬d∊s)/d
}
•Show NoConnections "BC"‿"DB"‿"CA"  # "A"


<⟜'a'⊸/ "Big Questions Notation"

l ← ⟨ "a ← 1", "bbc ← 2", "123", "45", "bcqq ← 23", "bcc ← 230" ⟩
PadBeforeArrow ← {
  index ← ⊑ 𝕩 ⊐ "←"
  isMember ← index ≠ ≠𝕩
  index isMember◶⊢‿(↑∾(0⌈𝕨-index)⊸/⟜" "∾↓) 𝕩
}

f ← > '←' ∊¨ l  # list indicating for each string whether there's an arrow
g ← l ⊔˜-⟜1+`¬0∾=´˘2↕f  # grouped by whether there's an arrow
h ← ∾ {⌈´ (⊐⟜"←")¨ 𝕩}¨ g  # maximum index of arrow per group
•Out¨ ∾ h {𝕨 PadBeforeArrow¨ 𝕩}¨ g

FormatTruncatedToOneDecimal ← (⊢↑˜(≠⊢)⌊2+⊢⊐"."˙)∘•Fmt
IntegerPartToListOfDigits ← {
    n‿d ← 10 { b𝕊n‿d: ⟨⌊n÷b, d∾˜b|n⟩ } •_while_ {b𝕊n‿d: n>0} ⌊𝕩‿⟨⟩
    d
}
IntegerPartToListOfDigits2 ← { 𝕊n:
    d ← ⟨⟩
    10 { b𝕊n:
        d ∾˜↩ b|n
        n ⌊∘÷ b
    } •_while_ {𝕩>0} ⌊n
    d
}

•Show IntegerPartToListOfDigits 33.13
•Show IntegerPartToListOfDigits2 33.13
