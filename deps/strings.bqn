Words ⇐ {(¯1¨⌾(i/⊢)+`(⊢>1»⊢) i←' '=𝕩)⊔𝕩}

ReplaceSquareByAngular ← { ('⟨'+']'=⊢)⌾((𝕩∊"[]")/⊢) 𝕩 }
ReplaceAngularBySquare ← { ('['+2×'⟩'=⊢)⌾((𝕩∊"⟨⟩")/⊢) 𝕩 }

ReplaceChar ← {
  ⟨old, new⟩ 𝕊 str:
  i ← str=old
  new¨⌾(i/⊢) str
}
