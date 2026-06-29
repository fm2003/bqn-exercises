# Returns a Yahtzee score card that shows which scores
# a player could pick from based on the given dice.
YahtzeeScoreCard ← { 𝕊y:
    HasNOfAKind ← {∨´𝕨≤/⁼𝕩}
    HasNSequentialDice ← {𝕨>≠⍷𝕩 ? 0 ; ∨´(𝕨-1)=(⊣´-⊢´)˘𝕨↕∨⍷𝕩}

    DieScoreRow ← { die𝕊count: ⟨(•Fmt die)∾'s', die×count⟩ }
    upperSection ← (⍷DieScoreRow¨(/⁼⊐)) ∧y
    lowerSection ← ⟨
        ⟨"Chance",                                   +´y⟩
        ⟨"3 of a Kind",    (3 HasNOfAKind y)       × +´y⟩
        ⟨"4 of a Kind",    (4 HasNOfAKind y)       × +´y⟩
        ⟨"Full House",     {⟨3, 2⟩ ≡ 2↑∨/⁼ y}       × 25⟩
        ⟨"Small Straight", (4 HasNSequentialDice y) × 30⟩
        ⟨"Large Straight", (5 HasNSequentialDice y) × 40⟩
        ⟨"Yahtzee",        (5 HasNOfAKind y)        × 50⟩
    ⟩
    scoreCard ← > upperSection ∾ lowerSection
    (⊢/˜0≠1⊑˘⊢) scoreCard
}

•Show YahtzeeScoreCard 1‿4‿3‿2‿5
•Show YahtzeeScoreCard 2‿2‿3‿3‿2
•Show YahtzeeScoreCard 2‿2‿3‿3‿2‿7‿7‿7‿4‿12‿5‿6

# Tests:
⟨_Assert1⟩ ⇐ •Import "deps/assert.bqn"

(YahtzeeScoreCard 2‿1‿5‿3‿4) ≡_Assert1 >⟨
    ⟨"1s", 1⟩
    ⟨"2s", 2⟩
    ⟨"3s", 3⟩
    ⟨"4s", 4⟩
    ⟨"5s", 5⟩
    ⟨"Chance", 15⟩
    ⟨"Small Straight", 30⟩
    ⟨"Large Straight", 40⟩
⟩

(YahtzeeScoreCard 3‿1‿1‿3‿3) ≡_Assert1 >⟨
    ⟨"1s", 2⟩
    ⟨"3s", 9⟩
    ⟨"Chance", 11⟩
    ⟨"3 of a Kind", 11⟩
    ⟨"Full House", 25⟩
⟩

# --- Small straight:

# Test all permutations which are small straights but not large straights
p ← <˘ (≍↕0){∾˝(0∾˘1+𝕩)⊸⊏˘⍒˘=⌜˜↕𝕨}´-⟜↕4  # permutations of 0 1 2 3
q ← ⥊p∾⌜(↕4)  # add one more die in the same range
{⟨"Small Straight", 30⟩ ∊_Assert1 YahtzeeScoreCard 𝕩}¨ ∾´{q+𝕩}¨ 1+↕3

# Other small straight cases that are not covered by the generated permutations:
(YahtzeeScoreCard 1‿2‿4‿5‿6) ≡_Assert1 >⟨
    ⟨"1s", 1⟩
    ⟨"2s", 2⟩
    ⟨"4s", 4⟩
    ⟨"5s", 5⟩
    ⟨"6s", 6⟩
    ⟨"Chance", 18⟩
⟩

(YahtzeeScoreCard 1‿2‿3‿5‿6) ≡_Assert1 >⟨
    ⟨"1s", 1⟩
    ⟨"2s", 2⟩
    ⟨"3s", 3⟩
    ⟨"5s", 5⟩
    ⟨"6s", 6⟩
    ⟨"Chance", 17⟩
⟩

(YahtzeeScoreCard 1‿2‿6‿4‿3) ≡_Assert1 >⟨
    ⟨"1s", 1⟩
    ⟨"2s", 2⟩
    ⟨"3s", 3⟩
    ⟨"4s", 4⟩
    ⟨"6s", 6⟩
    ⟨"Chance", 16⟩
    ⟨"Small Straight", 30⟩
⟩

(YahtzeeScoreCard 1‿5‿6‿4‿3) ≡_Assert1 >⟨
    ⟨"1s", 1⟩
    ⟨"3s", 3⟩
    ⟨"4s", 4⟩
    ⟨"5s", 5⟩
    ⟨"6s", 6⟩
    ⟨"Chance", 19⟩
    ⟨"Small Straight", 30⟩
⟩
