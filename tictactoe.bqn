# Returns the winner on the given tic-tac-toe board.
# Empty spots are represented by '-'.
# Someone wins if they filled an entire row, column, or diagonal with their character.
# If there are no winners, returns "Tie" if the game is over or "Ongoing" if there are empty spots left.
# If there are multiple winners, returns the first one.
GetWinner ← { 𝕊t:
    columns ← ⍉t
    diagonals ← (0‿0⍉⊢)˘(⊢≍⌽)t
    winners ← (⊢/˜'-'≠⊢) ((⊣`≡⊢)˘/⊏˘) t∾columns∾diagonals
    noWinnerText ← { ∨´'-'=⥊t ? "Ongoing" ; "Tie" }
    noWinnerText ⊣´ ⋈¨winners
}

•Show GetWinner [
    "XOXX"
    "OXXX"
    "OOX-"
    "OOOX"
]

# Tests:
⟨_Assert1⟩ ⇐ •Import "deps/assert.bqn"

(GetWinner 3‿3⥊"XXXOO-OXX") ≡_Assert1 "X"
(GetWinner 3‿3⥊"OXXXO---O") ≡_Assert1 "O"
(GetWinner 3‿3⥊"XXOO--OXX") ≡_Assert1 "Ongoing"
(GetWinner 3‿3⥊"XOXOXXOXO") ≡_Assert1 "Tie"
(GetWinner 3‿3⥊"---OXXOXO") ≡_Assert1 "Ongoing"
(GetWinner 3‿3⥊"---XXXOXO") ≡_Assert1 "X"
(GetWinner 3‿3⥊"---AAAOAO") ≡_Assert1 "A"
(GetWinner 4‿4⥊"XO--OX--OOX-OOOX") ≡_Assert1 "X"
(GetWinner 4‿4⥊"OOOXOOX-OXXXXOXX") ≡_Assert1 "X"
