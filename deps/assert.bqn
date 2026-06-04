⟨_Assert0, _Assert1⟩⇐

FormatOperands ← {
    𝕊𝕩: ∾⟨"𝕩:", @+10, •Fmt 𝕩⟩ ;
    𝕨𝕊𝕩: ∾⟨"𝕨:", @+10, •Fmt 𝕨, @+10, FormatOperands 𝕩⟩
}

_Assert_ ← {
    message ← "Expression was unexpectedly not " ∾ (•Fmt 𝕘) ∾ "." ∾ (@+10) ∾ 𝕨 FormatOperands 𝕩
    Unpack ← { ⟨⟩≡≢𝕩 ? ⊑𝕩 ; 𝕩 }  # Convert unit array to atom if needed
    message ! (𝕘 ≡ Unpack 𝕨𝔽𝕩)
}

_Assert0 ← {𝕗_Assert_ 0}
_Assert1 ← {𝕗_Assert_ 1}
