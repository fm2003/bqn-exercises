Words ⇐ { 𝕊s:
    wordIndices ← {¯1¨⌾(𝕩⊸/)+`(1⊸»<⊢)𝕩} ' '=s
    wordIndices ⊔ s
}

ReplaceSquareByAngular ← { ('⟨'+']'=⊢)⌾((𝕩∊"[]")⊸/) 𝕩 }
ReplaceAngularBySquare ← { ('['+2×'⟩'=⊢)⌾((𝕩∊"⟨⟩")⊸/) 𝕩 }

ReplaceChar ← {
  ⟨old, new⟩ 𝕊 str:
  new¨⌾((str=old)⊸/) str
}
