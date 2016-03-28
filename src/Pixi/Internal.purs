module Pixi.Internal
  ( (<:>)
  , DOM(..), DOMMutation(..), Render(..)
  , newPixi0, newPixi1, newPixi2
  ) where

import Prelude
import Data.Function (Fn3, Fn2, runFn3, runFn2)
import Control.Monad.Eff (Eff)

foreign import data DOM         :: *
foreign import data DOMMutation :: !
foreign import data Render      :: !

(<:>) :: forall a b e. Eff e a -> b -> Eff e b
(<:>) f b = f >>= const b >>> return

foreign import newPixi0 :: forall a e. String -> Eff e a

foreign import newPixi1Impl :: forall a b e. Fn2 String a (Eff e b)

newPixi1 = runFn2 newPixi1Impl

foreign import newPixi2Impl :: forall a b c e. Fn3 String a b (Eff e c)

newPixi2 = runFn3 newPixi2Impl
