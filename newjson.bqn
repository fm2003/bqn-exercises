ParseValue ← {
    '"'=⊑𝕩 ? (1↓¯1↓⊢) 𝕩 ; •ParseFloat 𝕩
}

JsonListToDepthTable ← { 𝕊j:
    # TODO: this accepts space-separated numbers, which is not valid JSON
    gi ← ¯1¨⌾(s/⊢)+`((1»⊢)<⊢) s←j∊"[], "

    elements ← ParseValue¨ gi ⊔ j
    depths ← ⊑¨ gi ⊔ +`(('['=⊢)-(']'=⊢)) j  # TODO: improve mask to avoid ⊑¨

    ⍉elements≍depths
}

a ← "[123, ""hallo"", [67, 89,[10,11],12]]"
•Show JsonListToDepthTable a
