# Vendored copy of Verbose Lean

This directory is a copy of [Verbose Lean](https://github.com/PatrickMassot/verbose-lean4)
by Patrick Massot, tag `v4.23.0` (commit `62558afa39b4b5c64cf45d36d0147a863a24982a`),
licensed under the Apache License 2.0 (see `LICENSE`).

## Modification

`Verbose/Infrastructure/Extension.lean`: the persistent environment extension that stores
the Verbose configuration was registered under the name `gameExt`, which collides with the
extension of the same name in lean4game's `GameServer`. Importing both fails with
`invalid environment extension, 'gameExt' has already been used`. Here it is renamed to
`verboseConfigExt`. Nothing else is changed.

Only the Lean sources needed to build the library are included (no paper, gif or docs).
