Split ← {
    𝕨𝕊⁼𝕩: (1↓·∾𝕨∾¨⊢) 𝕩 ;
    (¯1¨⌾(s/⊢)+`s←𝕨=𝕩)⊔𝕩
}
RoundDecimalToHalves ← {
    "There must be at most one dot" ! 1≥+´𝕩∊"."
    "There must only be digits or '.'" ! ∧´ 𝕩∊'.'∾'0'+↕10
    RoundParts ← {
        i‿d ← ((⊣+10×⊢)´⌽)¨ (2↑⊢)⌾(1⊑⊢) (⊢-'0'˙) 𝕩
        •Fmt¨ <⁼(25‿75⍋d)⊏⟨i∾0, i∾5, (i+1)∾0⟩
    }
    RoundParts⌾('.'Split⊢) 𝕩
}
WebLab2BS ← { ⟨studentNumber, ·, grade, ·⟩:
    ⟨studentNumber, RoundDecimalToHalves grade, "#"⟩
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
