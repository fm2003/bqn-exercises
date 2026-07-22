# A card is ⟨colour, count, shape, shading⟩
# Colour: G=green, R=red, P=purple
# Count: 1, 2, 3
# Shape: D=diamond, S=squiggle, O=oval
# Shading: S=solid, T=striped, O=open
cards ← [
    "G1DO"
    "R2ST"
    "P3OS"
]

AllEqual ← ⊣`≡⊢
AllDifferent ← ⍷≡⊢
IsSet ← {∧´(AllEqual∨AllDifferent)˘⍉𝕩}
•Show IsSet cards
