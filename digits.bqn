# ------------------------------------------------------------------------------
# Convert the integer part of a non-negative number to a list of base-10 digits.
# Implemented in 5 different programming styles.
# ------------------------------------------------------------------------------

IntegerPartToListOfDigitsMutation ← { 𝕊n:
    # Using while loop and mutation.
    ! n≥0
    d ← ⟨⟩
    { 𝕊m:
        d ∾˜↩ 10|m
        m ⌊∘÷ 10
    } •_while_ {𝕩>0} ⌊n
    d≢⟨⟩ ? d ; ⟨0⟩
}

IntegerPartToListOfDigitsWhile ← {
    # Using while loop but no mutation.
    ! 𝕩≥0
    n‿d ← { 𝕊n‿d: ⟨⌊n÷10, d∾˜10|n⟩ } •_while_ {𝕊n‿d: n>0} ⌊𝕩‿⟨⟩
    d≢⟨⟩ ? d ; ⟨0⟩
}

IntegerPartToListOfDigitsRecursion ← {
    # Using recursion.
    ! 𝕩≥0
    d ← { 𝕊0: ⟨⟩ ; 𝕊n: (𝕊⌊n÷10)∾10|n } ⌊𝕩
    d≢⟨⟩ ? d ; ⟨0⟩
}

NumDigits ← (1+·⌊10⋆⁼0.5+1⌈⊢)  # +0.5 because of logarithm imprecision, and 1⌈ because of 0

IntegerPartToListOfDigitsRepeat ← {
    # Using the Repeat primitive.
    ! 𝕩≥0
    ⌽10|⌊÷⟜10⍟(↕NumDigits) ⌊𝕩
}

IntegerPartToListOfDigitsAP ← {
    # Using pure array programming.
    # Example for 1234:
    # Determine number of digits: 4
    # Create the list ⟨1, 10, 100, 1000⟩
    # Divide 1234 by that list: ⟨1234, 123.4, 12.34, 1.234⟩
    # Every element modulo 10, and floored: ⟨4, 3, 2, 1⟩
    # Reverse: ⟨1, 2, 3, 4⟩
    ! 𝕩≥0
    ⌽10|⌊(⊢÷10⋆·↕NumDigits) ⌊𝕩
}

•Show IntegerPartToListOfDigitsMutation 1234.5
•Show IntegerPartToListOfDigitsWhile 1234.5
•Show IntegerPartToListOfDigitsRecursion 1234.5
•Show IntegerPartToListOfDigitsRepeat 1234.5
•Show IntegerPartToListOfDigitsAP 1234.5
