-- ----------------------------------------------------------------- [ Lib.idr ]
-- Module      : Data.Composition
-- Description : Composition extras much like Data.Composition for 
--               Haskell
-- --------------------------------------------------------------------- [ EOH ]

||| A bunch of function composition extras, inspired by the Haskell package of the same name.
module Data.Composition

%access export

infixl 9 .*
infixl 9 .**
infixl 9 -.*
infixl 9 -.**

on : (a -> a -> b) -> (c -> a) -> (c -> c -> b)
on op f = \x, y => op (f x) (f y)

||| Instead of `f = \x, y => 2 * y + x`, consider `f = (*2) .* (+)`
(.*) : (c -> d) -> (a -> b -> c) -> (a -> b -> d)
(.*) f g = \x, y => f (g x y)

(.**) : (d -> e) -> (a -> b -> c -> d) -> (a -> b -> c -> e)
(.**) f g = \x, y, z => f (g x y z)

(-.*) : (d -> b) -> (a -> b -> c) -> (a -> d -> c)
(-.*) f g = \x, y => g x (f y)

(-.**) : (e -> c) -> (a -> b -> c -> d) -> (a -> b -> e -> d)
(-.**) f g = \x, y, z => g x y (f z)
