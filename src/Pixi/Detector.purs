module Pixi.Detector where

import Prelude
import Pixi.DisplayObject.Container.Stage (Stage)
import Pixi.Internal (DOMMutation, DOM, (<:>), Render)
import Control.Monad.Eff (Eff)
import Data.Function (Fn2, runFn2)
import Data.Foreign.OOFFI (method1Eff)

type Renderer = { view   :: DOM }

render :: forall e. Stage -> Renderer -> Eff (render :: Render | e) Renderer
render s r = method1Eff "render" r s <:> r

foreign import autoDetectRendererImpl :: forall e. Fn2 Number Number (Eff e Renderer)

autoDetectRenderer :: forall a. Number -> Number -> Eff a { view :: DOM }
autoDetectRenderer = runFn2 autoDetectRendererImpl

foreign import appendToBody :: forall e. DOM -> Eff (domMutation :: DOMMutation | e) Unit
