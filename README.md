# composition

This provides a `Data.Composition` module, much like the Haskell
[composition](https://hackage.haskell.org/package/composition-1.0.2.1) package
or the
[composition-extra](https://hackage.haskell.org/package/composition-extra)
package.

## Installation

```
idris --install composition.ipkg
```

## Use

As an example, you could replace

```
f = \x, y => 2 * y + x
```

with

```
f = (*2) .* +
```
