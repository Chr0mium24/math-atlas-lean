import Game.Levels.SpectralWorld

Title "数学的骨架 · 证明世界"
Introduction
"
这是网站《数学的骨架》的证明练习部分。现成的 Lean 游戏已经覆盖了逻辑、集合、线性代数（到 Cauchy–Schwarz）和实分析的 ε-N，
这里只做它们还没覆盖的部分，从谱定理开始。

证明用 Verbose Lean 的写法：每一行读起来就是纸上证明的一句话。命令是英文的（Lean 不接受中文关键字），讲解和提示是中文的。

当前是原型，只有一关。
"

Info "
- 网站：《数学的骨架》（math-atlas）
- 源码：github.com/Chr0mium24/math-atlas-lean
- 用到：lean4game、Mathlib、Verbose Lean（Patrick Massot，Apache-2.0）
"

Languages "zh"
CaptionShort "谱定理世界（原型）"
CaptionLong "从 Cauchy–Schwarz 接着往下：对称算子、正交特征向量、谱定理，用 Verbose Lean 的自然语言写法证明。"

MakeGame
