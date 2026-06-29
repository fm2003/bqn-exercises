# ------------------------------------------------------------------------------
# Convert the integer part of a non-negative number to a list of base-10 digits.
# Implemented in several different programming styles.
# ------------------------------------------------------------------------------

While ← {𝕩•_while_𝕨@}´  # Just so we can put the condition before the body of the `while`

IntegerPartToListOfDigitsImperative1 ← { 𝕊n:
    # Probably closest to a Python-like implementation.
    # Using while loop and mutation.
    ! n≥0
    d ← ⟨⟩
    m ← ⌊n
    While {𝕤 ⋄ m>0 }‿{ 𝕤
        d ↩ (10|m)∾d  # Or: d ∾˜↩ 10|m
        m ↩ ⌊m÷10     # Or: m ⌊∘÷↩ 10
    }
    d≢⟨⟩ ? d ; ⟨0⟩
}

IntegerPartToListOfDigitsImperative2 ← { 𝕊n:
    # Using while loop and mutation, but no mutation for the 'loop counter'
    # and using the built-in •_while_ directly.
    ! n≥0
    d ← ⟨⟩
    { 𝕊m:
        d ∾˜↩ 10|m
        ⌊m÷10
    } •_while_ {𝕩>0} ⌊n
    d≢⟨⟩ ? d ; ⟨0⟩
}

IntegerPartToListOfDigitsImperative3 ← {
    # Using while loop but no mutation.
    ! 𝕩≥0
    ·‿d ← { 𝕊n‿d: ⟨⌊n÷10, d∾˜10|n⟩ } •_while_ {𝕊n‿·: n>0} ⌊𝕩‿⟨⟩
    d≢⟨⟩ ? d ; ⟨0⟩
}

IntegerPartToListOfDigitsRecursive ← {
    # Using recursion.
    ! 𝕩≥0
    d ← { 𝕊0: ⟨⟩ ; 𝕊n: (𝕊⌊n÷10)∾10|n } ⌊𝕩
    d≢⟨⟩ ? d ; ⟨0⟩
}

NumDigits ← {1+⌊•math.Log10 1⌈𝕩}  # 1⌈ because of 0

IntegerPartToListOfDigitsRepeat ← {
    # Using the Repeat primitive.
    ! 𝕩≥0
    ⌽10|(⌊⊢÷10˙)⍟(↕NumDigits) ⌊𝕩
}

IntegerPartToListOfDigitsAP ← {
    # Using pure array programming.
    # Example for 1234:
    # 1234÷⟨1, 10, 100, 1000⟩ = ⟨1234, 123.4, 12.34, 1.234⟩
    # After applying 10|⌊: ⟨4, 3, 2  1⟩
    # After applying reverse: ⟨1, 2, 3, 4⟩
    ! 𝕩≥0
    ⌽10|⌊(⊢÷10⋆·↕NumDigits) ⌊𝕩
}

•Show IntegerPartToListOfDigitsImperative1 1234.5
•Show IntegerPartToListOfDigitsImperative2 1234.5
•Show IntegerPartToListOfDigitsImperative3 1234.5
•Show IntegerPartToListOfDigitsRecursive 1234.5
•Show IntegerPartToListOfDigitsRepeat 1234.5
•Show IntegerPartToListOfDigitsAP 1234.5
