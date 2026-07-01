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
AlignArrows ← {𝕊l:
    ai ← ∾(⊢⊐"←"˙)¨l         # index of first arrow for each line
    ha ← ai<≠¨l              # whether it has an arrow
    gi ← +`(»«≠⊢) ha         # index for grouping by whether there is an arrow
    ti ← (⌈´⊣`⊢)¨⌾(gi⊔⊢) ai  # index at which the arrow should end up for each line
    s  ← (⊢⥊" "˙)¨ha×ti-ai   # spaces to add
    ba ← ai↑¨l               # part before arrow
    aa ← ai↓¨l               # part after arrow
    ba∾¨s∾¨aa                # result
}
•Out¨ AlignArrows l

FormatTruncatedToOneDecimal ← (⊢↑˜(≠⊢)⌊2+⊢⊐"."˙)∘•Fmt
