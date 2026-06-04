# Returns the winner on the given tic-tac-toe board.
# If there are multiple winners, returns the first one.
# If there are no winners, returns "Tie" if the game is over or "Ongoing" if there are empty spots left.
GetWinner ← { 𝕊t:
    columns ← ⍉t
    diagonals ← [0‿0⍉t, 0‿0⍉⌽t]
    unique ← ⍷¨<˘ t∾columns∾diagonals
    winners ← {1=≠𝕩}¨⊸/ unique
    hasEmptySpot ← ⊑'-'∊⥊t
    { 0=≠winners ? hasEmptySpot⊸⊑⟨"Tie", "Ongoing"⟩ ; ⊑winners }
}

# Tests:
⟨_Assert1⟩ ⇐ •Import "deps/assert.bqn"

(GetWinner 3‿3⥊"XXXOO-OXX") ≡_Assert1 "X"
(GetWinner 3‿3⥊"OXXXO---O") ≡_Assert1 "O"
(GetWinner 3‿3⥊"XXOO--OXX") ≡_Assert1 "Ongoing"
(GetWinner 3‿3⥊"XOXOXXOXO") ≡_Assert1 "Tie"
