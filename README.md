# 数学的骨架 · 证明世界（math-atlas-lean）

网站《数学的骨架》的证明练习部分，基于 [lean4game](https://github.com/leanprover-community/lean4game)。

现成的 Lean 游戏已经覆盖了逻辑、集合、线性代数（到 Cauchy–Schwarz）和实分析的 ε-N，这里不重复，只做它们还没覆盖的部分，从谱定理开始。

证明用 [Verbose Lean](https://github.com/PatrickMassot/verbose-lean4)（Patrick Massot，Apache-2.0）的写法：每一行读起来就是纸上证明的一句话。命令是英文的（Lean 不接受中文关键字），讲解和提示是中文的。

## 当前状态

原型：`SpectralWorld` 只有一关（不同特征值的特征向量互相垂直），用来验证 Verbose 能不能在游戏服务器里正常使用。

## 版本

全部固定在 v4.23.0：Lean、Mathlib、Verbose Lean、GameServer。`lake-manifest.json` 的依赖版本与 Set Theory Game / Natural Number Game 一致。

Verbose Lean 放在 `vendor/verbose/`，是 v4.23.0 的副本，只改了一个名字：它原本把配置存在名为 `gameExt` 的环境扩展里，和 lean4game 的同名扩展冲突，两者无法同时导入。这里改名为 `verboseConfigExt`，详见 `vendor/verbose/NOTICE.md`。

## 构建与发布

推送到 `main` 后，GitHub Actions（`.github/workflows/build.yml`）会自动构建并上传 `game.zip`。

导入到公共游戏服务器（需要时手动执行）：

```
https://adam.math.hhu.de/import/trigger/chr0mium24/math-atlas-lean
```

之后在这里玩：`https://adam.math.hhu.de/#/g/chr0mium24/math-atlas-lean`

## 结构

- `Game/Metadata.lean`：所有关卡共用的导入（GameServer、Mathlib 内积空间、Verbose 英文战术）和本游戏自己的小引理。
- `Game/Levels/SpectralWorld/`：谱定理世界的关卡。
- `Game.lean`：标题页信息，最后必须是 `MakeGame`。
