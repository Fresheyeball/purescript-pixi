module Pixi.Detector where

import Pixi.DisplayObject.Container.Stage
import Pixi.Internal
import Control.Monad.Eff
import Data.Function
import Data.Foreign.OOFFI

type Renderer = { view   :: DOM }

render :: forall e. Stage -> Renderer -> Eff (render :: Render | e) Renderer
render s r = method1Eff "render" r s <:> r 

foreign import autoDetectRendererImpl
  "function autoDetectRendererImpl(x, y){\
  \  return function(){\
  \    return PIXI.autoDetectRenderer(x, y);\
  \  };\
  \}" :: forall e. Fn2 Number Number (Eff e Renderer)
autoDetectRenderer = runFn2 autoDetectRendererImpl

foreign import appendToBody 
  "function appendToBody(x){\
  \  return function(){\
  \    document.body.appendChild(x);\
  \  };\
  \}" :: forall e. DOM -> Eff (domMutation :: DOMMutation | e) Unit
