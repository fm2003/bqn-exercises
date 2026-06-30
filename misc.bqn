_st ← {1↓(⊢𝔽»)}

•Show ∧´ =_st -_st ∧ 3‿1‿7‿9‿5
•Show ((⊣`≡⊢)1↓·+`⁼∧) 3‿1‿7‿9‿5

RoundPos ← (·⌊0.5+⊢)⌾(10×⊢)  # round to nearest tenth, ties towards infinity
Round ← (××·⌊0.5+|)⌾(10×⊢)  # round to nearest tenth, ties away from zero
Round 3.149

# NoConnections ← (¬∘∊˜/⊢)˝·⍉>
NoConnections ← {
    [s, d] ← ⍉>𝕩
    (¬d∊s)/d
}
•Show NoConnections "BC"‿"DB"‿"CA"  # "A"


•Show (⊢/˜'a'>⊢) "Big Questions Notation"

l ← ⟨ "a ← 1", "bbc ← 2", "123", "45", "bcqq ← 23", "bcc ← 230" ⟩
PadBeforeArrow ← {
  index ← ⊑𝕩⊐"←"
  isMember ← index ≠ ≠𝕩
  index (↑∾(" "⥊˜0⌈𝕨-⊣)∾↓)⍟isMember 𝕩
}

f ← >'←'∊¨l  # list indicating for each string whether there's an arrow
g ← l⊔˜(1-˜·+`»≠⊢)f  # grouped by whether there's an arrow
h ← ⌈´¨(⊑⊢⊐"←"˙)⚇1 g  # maximum index of arrow per group
•Out¨ ∾ h {𝕨 PadBeforeArrow¨ 𝕩}¨ g

FormatTruncatedToOneDecimal ← (⊢↑˜(≠⊢)⌊2+⊢⊐"."˙)∘•Fmt
