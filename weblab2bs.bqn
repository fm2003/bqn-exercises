⟨Split⟩ ⇐ •Import "deps/strings.bqn"

ParseFloat ← { 𝕊⁼𝕩: •Fmt 𝕩 ; •ParseFloat 𝕩 }

WebLab2BS ← { ⟨studentNumber, ·, grade, ·⟩:
    ⟨studentNumber, (⌊0.5+⊢)⌾(2×ParseFloat) grade, "#"⟩
}

examName ← "Endterm exam"
stem     ← examName∾" 2025-2026 grades"
lines    ← •FLines stem∾".csv"
! "Course,CSE1110"≡⊑lines
! ∨´"Student Number"⍷5⊑lines

header  ← <"OrgDefinedId,"∾examName∾" Points Grade,End-of-Line Indicator"
bsLines ← WebLab2BS⌾(','Split⊢)¨ 6↓lines
•Out¨ bsLines
# (stem∾" for BS.csv") •FLines header ∾ bsLines
