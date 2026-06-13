# Converts the given floating-point number to a fraction ⟨numerator, denominator⟩,
# with the denominator limited by the given maxDen.
# This version uses brute force and simply tries all denominators up to maxDen.
Float2Fraction ← { maxDen 𝕊 f:
    ! maxDen ≥ 1
    denominators ← 1+↕maxDen
    numerators ← (××·⌊0.5+|) denominators×f
    ((⊢⊐⌊´)·|f-÷´)⊸(⊑¨) ⟨numerators, denominators⟩  # Return the fraction with the smallest absolute difference from f
}

# This version uses continued fractions to end up at the result.
Float2FractionFast ← { maxDen 𝕊 f:
    ! maxDen ≥ 1
    NextConvergent ← { g‿p0‿q0‿p1‿q1: ⟨(÷⊢-⌊)g, p1, q1, p0+p1×⌊g, q0+q1×⌊g⟩ }
    ·‿·‿q0‿p1‿q1 ← c ← NextConvergent •_while_ { g‿·‿q0‿·‿q1: (q0+q1×⌊g) ≤ maxDen } ⟨f, 0, 1, 1, 0⟩
    ·‿·‿·‿n1‿d1 ← NextConvergent ⟨(maxDen-q0)÷q1⟩∾1↓c  # Best semi-convergent with denominator≤maxDen
    ⟨p1, q1⟩ ⊣⍟(<○(|f-÷´)) ⟨n1, d1⟩  # Return the fraction with the smallest absolute difference from f
}

•Show 50 Float2Fraction π
•Show 50 Float2FractionFast π

# Tests:
⟨_Assert1⟩ ⇐ •Import "deps/assert.bqn"

(10 Float2FractionFast 0.33) ≡_Assert1 ⟨1, 3⟩
(100 Float2FractionFast 0.33) ≡_Assert1 ⟨33, 100⟩
(99 Float2FractionFast π) ≡_Assert1 ⟨311, 99⟩
(99 Float2FractionFast ¯π) ≡_Assert1 ⟨¯311, 99⟩
(1 Float2FractionFast π) ≡_Assert1 ⟨3, 1⟩
(6 Float2FractionFast π) ≡_Assert1 ⟨19, 6⟩
(6 Float2FractionFast ¯π) ≡_Assert1 ⟨¯19, 6⟩
(1000 Float2FractionFast √2) ≡_Assert1 ⟨1393, 985⟩
(1000 Float2FractionFast 1.25) ≡_Assert1 ⟨5, 4⟩
