examName ← "Endterm exam"
stem     ← examName∾" 2025-2026 grades"
lines    ← •FLines stem∾".csv"
! "Course,CSE1110"≡⊑lines
! ∨´"Student Number"⍷5⊑lines

Split ← {(¯1¨⌾(s/⊢)+`s←','=𝕩)⊔𝕩}
[studentNumbers, ·, grades, ·] ← ⍉>Split¨ 6↓lines
gradesRounded ← (××·⌊0.5+|)⌾(2×⊢) •ParseFloat¨ grades

eol    ← "#"¨studentNumbers
header ← <"OrgDefinedId,"∾examName∾" Points Grade,End-of-Line Indicator"
output ← header ∾ (<1↓·∾','∾¨⊢)˘⍉>⟨studentNumbers, •Fmt¨ gradesRounded, eol⟩
(stem∾" for BS.csv") •FLines output
