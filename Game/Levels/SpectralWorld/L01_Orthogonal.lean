import Game.Metadata

-- Mathlib's ⟪x, y⟫_ℝ notation is scoped
open scoped InnerProductSpace

World "SpectralWorld"
Level 1

Title "不同特征值的特征向量互相垂直"

Introduction "
谱定理的第一块砖。

设 $T$ 是对称的：对所有 $x, y$，都有 $\\langle Tx, y\\rangle = \\langle x, Ty\\rangle$。
如果 $Tu = a u$，$Tv = b v$，而且 $a \\ne b$，那么 $u$ 和 $v$ 一定互相垂直。

纸上的证明只有两句：

1. $a\\langle u,v\\rangle = \\langle au, v\\rangle = \\langle Tu, v\\rangle = \\langle u, Tv\\rangle = \\langle u, bv\\rangle = b\\langle u,v\\rangle$；
2. 因为 $a \\ne b$，只能 $\\langle u,v\\rangle = 0$。

这一关的写法和纸上一样：先用 `Fact … by Calc …` 写出第 1 句的等式链，再用 `We conclude by …` 写出第 2 句。
"

Statement {V : Type} [NormedAddCommGroup V] [InnerProductSpace ℝ V]
    (T : V → V) (hT : ∀ x y : V, ⟪T x, y⟫_ℝ = ⟪x, T y⟫_ℝ)
    (u v : V) (a b : ℝ) (hu : T u = a • u) (hv : T v = b • v) (hab : a ≠ b) :
    ⟪u, v⟫_ℝ = 0 := by
  Hint "先把第 1 句写成一个事实，起名叫 `key`：

  `Fact key : a * ⟪u, v⟫_ℝ = b * ⟪u, v⟫_ℝ by`

  下一行缩进，用 `Calc` 把等式链一步步写出来，每一步后面写上理由。"
  Fact key : a * ⟪u, v⟫_ℝ = b * ⟪u, v⟫_ℝ by
    Calc a * ⟪u, v⟫_ℝ = ⟪a • u, v⟫_ℝ by rw [real_inner_smul_left]
      _ = ⟪T u, v⟫_ℝ by rw [hu]
      _ = ⟪u, T v⟫_ℝ from hT applied to u and v
      _ = ⟪u, b • v⟫_ℝ by rw [hv]
      _ = b * ⟪u, v⟫_ℝ by rw [real_inner_smul_right]
  Hint "现在有了 `{key}`。最后一句：因为 $a \\ne b$，只能 $\\langle u,v\\rangle = 0$。"
  We conclude by cancel_of_ne applied to hab and key

Conclusion "
完成。注意你**没有用到** $T$ 是线性的：这个结论只需要对称性和两个特征方程。
少用一个条件，定理就更强，这正是「吃透」要留意的地方。
"

/-- 证明一个中间事实并给它起名：`Fact 名字 : 命题 by …`。 -/
TacticDoc «Fact»

/-- 写一条等式链：`Calc A = B by 理由`，下一行 `_ = C from 理由`…… -/
TacticDoc «Calc»

/-- 用一个已有的结论收尾：`We conclude by 定理 applied to 条件1 and 条件2`。 -/
TacticDoc «We»

/-- 用等式 `h : A = B` 把目标里的 `A` 改写成 `B`：`rw [h]`。 -/
TacticDoc rw

/-- $\langle r x, y\rangle = r\langle x, y\rangle$ -/
TheoremDoc real_inner_smul_left as "real_inner_smul_left" in "内积"

/-- $\langle x, r y\rangle = r\langle x, y\rangle$ -/
TheoremDoc real_inner_smul_right as "real_inner_smul_right" in "内积"

/-- 若 $a \ne b$ 且 $a x = b x$，则 $x = 0$。 -/
TheoremDoc cancel_of_ne as "cancel_of_ne" in "实数"

NewTactic «Fact» «Calc» «We» rw
NewTheorem real_inner_smul_left real_inner_smul_right cancel_of_ne
