-- ----------------------------------------------------------------- [ Lib.idr ]
-- Module      : Data.Composition
-- Description : Composition extras much like Data.Composition for 
--               Haskell
-- --------------------------------------------------------------------- [ EOH ]

||| A bunch of function composition extras, inspired by the Haskell package of the same name.
module Data.Composition

%default total

%access export

infixl 9 .*
infixl 9 .**
infixl 9 .***
infixl 9 .****
infixl 9 .*****
infixl 9 -.*
infixl 9 -.**
infixl 9 -.***
infixl 9 -.****
infixl 9 -.*****
infixl 9 *.
infixl 9 **.
infixl 9 ***.
infixl 9 ****.
infixl 9 *****.
infixl 9 &
infixl 9 &~
infixl 9 &~~
infixl 9 &~~~
infixl 9 -.
infixl 9 .$

on : (a -> a -> b) -> (c -> a) -> (c -> c -> b)
on op f = \x, y => op (f x) (f y)

||| Infix equivalent to 'on'
(.$) : (a -> a -> b) -> a -> b
(.$) f x = f x x

||| Backwards function composition
(-.) : (a -> b) -> (b -> c) -> (a -> c)
(-.) f g = g . f

||| Composition when one function has arity > 1 
|||
||| Instead of `f = \x, y => 2 * y + x`, we can write `f = (*2) .* (+)`
(.*) : (c -> d) -> (a -> b -> c) -> (a -> b -> d)
(.*) f g = \x, y => f (g x y)

(.**) : (d -> e) -> (a -> b -> c -> d) -> (a -> b -> c -> e)
(.**) f g = \x, y, z => f (g x y z)

(.***) : (e -> f) -> (a -> b -> c -> d -> e) -> (a -> b -> c -> d -> f)
(.***) f g = \w, x, y, z => f (g w x y z)

(.****) : (f -> g) -> (a -> b -> c -> d -> e -> f) -> (a -> b -> c -> d -> e -> g)
(.****) f g = \v, w, x, y, z => f (g v w x y z)

(.*****) : (g -> h) -> (a -> b -> c -> d -> e -> f -> g) -> (a -> b -> c -> d -> e -> f -> h)
(.*****) f g = \u, v, w, x, y, z => f (g u v w x y z)

(*.) : (a -> b -> c) -> (c -> d) -> (a -> b -> d)
(*.) = flip (.*)

(**.) : (a -> b -> c -> d) -> (d -> e) -> (a -> b -> c -> e)
(**.) = flip (.**)

(***.) : (a -> b -> c -> d -> e) -> (e -> f) -> (a -> b -> c -> d -> f)
(***.) = flip (.***)

(****.) : (a -> b -> c -> d -> e -> f) -> (f -> g) -> (a -> b -> c -> d -> e -> g)
(****.) = flip (.****)

(*****.) : (a -> b -> c -> d -> e -> f -> g) -> (g -> h) -> (a -> b -> c -> d -> e -> f -> h)
(*****.) = flip (.*****)

||| The Oedipus combinator
(-.*) : (d -> b) -> (a -> b -> c) -> (a -> d -> c)
(-.*) f g = \x, y => g x (f y)

||| Composition on the last argument rather than the return value
(-.**) : (e -> c) -> (a -> b -> c -> d) -> (a -> b -> e -> d)
(-.**) f g = \x, y, z => g x y (f z)

(-.***) : (f -> d) -> (a -> b -> c -> d -> e) -> (a -> b -> c -> f -> e)
(-.***) f g = \w, x, y, z => g w x y (f z)

(-.****) : (g -> e) -> (a -> b -> c -> d -> e -> f) -> (a -> b -> c -> d -> g -> f)
(-.****) f g = \v, w, x, y, z => g v w x y (f z)

(-.*****) : (h -> f) -> (a -> b -> c -> d -> e -> f -> g) -> (a -> b -> c -> d -> e -> h -> g)
(-.*****) f g = \u, v, w, x, y, z => g u v w x y (f z)

||| Backwards function application
(&) : a -> (a -> b) ->  b
(&) x f = f x

(&~) : (a -> b -> c) -> b -> a -> c
(&~) = flip

(&~~) : (a -> b -> c -> d) -> c -> b -> a -> d
(&~~) f = \x, y, z => f z y x

(&~~~) : (a -> b -> c -> d -> e) -> d -> c -> b -> a -> e
(&~~~) f = \w, x, y, z => f z y x w
