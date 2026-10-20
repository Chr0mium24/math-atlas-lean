import GameServer
import Mathlib.Analysis.InnerProductSpace.Basic
import Verbose.English.All

/-!
Available in every level: Mathlib's real inner product spaces, Verbose Lean's
controlled-natural-language tactics (English keywords; Lean does not accept
Chinese keywords), and a few small lemmas of our own.
-/

/-- 实内积空间里的内积：`⟪x, y⟫`。

Mathlib's own `⟪x, y⟫_ℝ` notation is scoped, and an `open` inside a level file is
not carried into the player's editor, so the game defines a global one here
(it also makes the goal panel print `⟪u, v⟫` instead of `inner ℝ u v`). -/
notation3:max "⟪" x ", " y "⟫" => @inner ℝ _ _ x y

/-- 若 `a ≠ b` 且 `a * x = b * x`，则 `x = 0`。 -/
theorem cancel_of_ne {a b x : ℝ} (hab : a ≠ b) (h : a * x = b * x) : x = 0 := by
  have h2 : (a - b) * x = 0 := by rw [sub_mul]; linarith
  exact (mul_eq_zero.mp h2).resolve_left (sub_ne_zero.mpr hab)
