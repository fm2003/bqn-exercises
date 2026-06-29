⟨ Words ⟩ ⇐ •Import "deps/strings.bqn"

# Returns how many times each word occurs in the file with the given name.
# Currently returns a list of lists where the count comes last,
# but depending on the use case it might be more useful to have the count first (so you can sort on it)
# or to return a HashMap (or something else).
WordFrequencies ← { 𝕊filename:
    words ← ∾ Words¨ (' '∾⊢)¨ •FLines filename
    (⍷⋈¨(/⁼⊐)) words
}

# Tests:
⟨ _Assert1 ⟩ ⇐ •Import "deps/assert.bqn"
(WordFrequencies "words.txt") ≡_Assert1 ⟨
    ⟨"grouses", 3⟩
    ⟨"depositing", 4⟩
    ⟨"able", 5⟩
    ⟨"processor", 4⟩
⟩
