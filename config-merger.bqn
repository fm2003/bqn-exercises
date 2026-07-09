⟨ Parse ⟩ ⇐ •Import "bqn-libs/json.bqn"

GetValue ← { keys𝕊jsonArray:
    GetDirectValue ← { key𝕊[keys, values]: values⊑˜(keys⊐⊢)⌾<key }
    GetDirectValue´ •Show ⌽ ⟨jsonArray⟩∾(<⍟(1≡≡) keys)
    # LevelDeeper ← { keysToFind‿[keys, values]: ⟨1↓keysToFind, values⊑˜keys⊐1↑keysToFind⟩ }
    # ·‿values ← LevelDeeper •_while_ {keys‿·: 0≠≠keys} keys‿jsonArray
    # values
}

# Assumes for now that all major cells in 'objects' are JSON objects (not lists or strings etc.)
MergeJsonObjects ← { 𝕊objects:
    [keys, values] ← ∾˘´objects
    AreTwoObjects ← (∧´ 2=(≠¨∾=¨)∘⋈)  # if rank and length of both arguments are 2
    (⍷keys) ≍ ((MergeJsonObjects⋈)⍟AreTwoObjects)´¨ (⊐keys)⊔values
}

j ← Parse •FChars "config.json"
j2 ← Parse •FChars "config2.json"
j3 ← Parse •FChars "config3.json"

# •Show MergeJsonObjects j‿j2‿j3
# •Out "    " Parse⁼ MergeJsonObjects j‿j2‿j3


# •Show "parent" GetValue j
•Show "parent"‿"sub"‿"grandchild" GetValue j
# •Show "nestedList" GetValue j
# # •Show ⟨"parent", "nonexist"⟩ GetValue j

DepthTableToJsonString ← { ⟨keys, values, depths⟩:
    curlyBraceOpenMask ← (⊢>») depths
    curlyBraceCloseCounts ← (0⌈⊢-«) depths
    # •Show [curlyBraceOpenMask, keys, values, curlyBraceCloseCounts, depths]
    ∾ KeyLine˘ ⍉[curlyBraceOpenMask, keys, values, curlyBraceCloseCounts, depths]
}

KeyLine ← { ⟨o, k, v, c, d⟩:
    closing ← ∾∾ {(@+10)∾(𝕩/⟨"    "⟩)∾"}"}¨ (d-1)-↕c
    <∾⟨o/"{", @+10, d/"    ", """", k, """: ", •Fmt v, closing⟩
}

keys ← ⟨"key","parent","child","sub","grandchild","list","nestedlist","obj","a"⟩
values ← 1‿⟨⟩‿2‿⟨⟩‿5‿⟨3, 1, 4⟩‿⟨⟨6, 7⟩, ⟨8, 9⟩⟩‿""‿1
depths ← 1‿1‿2‿2‿3‿1‿1‿1‿2
# •Out DepthTableToJsonString ⟨keys, values, depths⟩
