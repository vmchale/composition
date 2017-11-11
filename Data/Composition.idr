-- ----------------------------------------------------------------- [ Lib.idr ]
-- Module      : Data.Composition
-- Description : Composition extras much like Data.Composition for 
--               Haskell
-- --------------------------------------------------------------------- [ EOH ]

||| A bunch of function composition extras, inspired by the Haskell package of the same name.
module Data.Composition

import Hezarfen

%language ElabReflection

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
on = %runElab hezarfenExpr

||| Infix equivalent to 'on'
(.$) : (a -> a -> b) -> a -> b
(.$) = %runElab hezarfenExpr

||| Backwards function composition
(-.) : (a -> b) -> (b -> c) -> (a -> c)
(-.) = %runElab hezarfenExpr

||| Composition when one function has arity > 1 
|||
||| Instead of `f = \x, y => 2 * y + x`, we can write `f = (*2) .* (+)`
(.*) : (c -> d) -> (a -> b -> c) -> (a -> b -> d)
(.*) = %runElab hezarfenExpr

(.**) : (d -> e) -> (a -> b -> c -> d) -> (a -> b -> c -> e)
(.**) = %runElab hezarfenExpr

(.***) : (e -> f) -> (a -> b -> c -> d -> e) -> (a -> b -> c -> d -> f)
(.***) = %runElab hezarfenExpr

(.****) : (f -> g) -> (a -> b -> c -> d -> e -> f) -> (a -> b -> c -> d -> e -> g)
(.****) = %runElab hezarfenExpr

(.*****) : (g -> h) -> (a -> b -> c -> d -> e -> f -> g) -> (a -> b -> c -> d -> e -> f -> h)
(.*****) = %runElab hezarfenExpr

(*.) : (a -> b -> c) -> (c -> d) -> (a -> b -> d)
(*.) = %runElab hezarfenExpr

(**.) : (a -> b -> c -> d) -> (d -> e) -> (a -> b -> c -> e)
(**.) = %runElab hezarfenExpr

(***.) : (a -> b -> c -> d -> e) -> (e -> f) -> (a -> b -> c -> d -> f)
(***.) = %runElab hezarfenExpr

(****.) : (a -> b -> c -> d -> e -> f) -> (f -> g) -> (a -> b -> c -> d -> e -> g)
(****.) = %runElab hezarfenExpr

(*****.) : (a -> b -> c -> d -> e -> f -> g) -> (g -> h) -> (a -> b -> c -> d -> e -> f -> h)
(*****.) = %runElab hezarfenExpr

||| The Oedipus combinator
(-.*) : (d -> b) -> (a -> b -> c) -> (a -> d -> c)
(-.*) = %runElab hezarfenExpr

||| Composition on the last argument rather than the return value
(-.**) : (e -> c) -> (a -> b -> c -> d) -> (a -> b -> e -> d)
(-.**) = %runElab hezarfenExpr

(-.***) : (f -> d) -> (a -> b -> c -> d -> e) -> (a -> b -> c -> f -> e)
(-.***) = %runElab hezarfenExpr 

(-.****) : (g -> e) -> (a -> b -> c -> d -> e -> f) -> (a -> b -> c -> d -> g -> f)
(-.****) = %runElab hezarfenExpr 

(-.*****) : (h -> f) -> (a -> b -> c -> d -> e -> f -> g) -> (a -> b -> c -> d -> e -> h -> g)
(-.*****) = %runElab hezarfenExpr 

||| Backwards function application
(&) : a -> (a -> b) ->  b
(&) = %runElab hezarfenExpr

(&~) : (a -> b -> c) -> b -> a -> c
(&~) = %runElab hezarfenExpr

(&~~) : (a -> b -> c -> d) -> c -> b -> a -> d
(&~~) = %runElab hezarfenExpr

(&~~~) : (a -> b -> c -> d -> e) -> d -> c -> b -> a -> e
(&~~~) = %runElab hezarfenExpr
