⟨_Assert0, _Assert1⟩⇐

FormatArguments ← { 𝕊values:
    names ← ⌽'𝕩'-↕≠values
    Format ← { ∾⟨@+10, 𝕨, ':', @+10, •Fmt 𝕩⟩ }
    ∾ names Format¨ values
}

_Assert_ ← {
    message ← "Result of " ∾ (•Fmt 𝕗) ∾ " was unexpectedly not " ∾ (•Fmt 𝕘) ∾ "." ∾ FormatArguments 𝕨⋈𝕩
    Unpack ← (⟨⟩≡≢)⍟⊑  # Convert unit array to atom if needed
    message ! (𝕘 ≡ Unpack 𝕨𝔽𝕩)
}

_Assert0 ← {𝕗_Assert_ 0}
_Assert1 ← {𝕗_Assert_ 1}
