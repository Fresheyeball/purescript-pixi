module Pixi.Internal 
  ( (<:>)
  , DOM(..), DOMMutation(..), Render(..)
  , newPixi0, newPixi1, newPixi2 ) where

import Data.Function
import Control.Monad.Eff

foreign import data DOM         :: *
foreign import data DOMMutation :: !
foreign import data Render      :: !

(<:>) :: forall a b e. Eff e a -> b -> Eff e b
(<:>) f b = f >>= const b >>> return

foreign import newPixi0 
  "function newPixi0(objName){\
  \  return function(){\
  \    return new PIXI[objName]();\
  \  };\
  \}" :: forall a e. String -> Eff e a

foreign import newPixi1Impl
  "function newPixi1Impl(objName, arg1){\
  \  return function(){\
  \    return new PIXI[objName](arg1);\
  \  };\
  \}" :: forall a b e. Fn2 String a (Eff e b)
newPixi1 = runFn2 newPixi1Impl

foreign import newPixi2Impl
  "function newPixi2Impl(objName, arg1, arg2){\
  \  return function(){\
  \    return new PIXI[objName](arg1, arg2);\
  \  };\
  \}" :: forall a b c e. Fn3 String a b (Eff e c)
newPixi2 = runFn3 newPixi2Impl