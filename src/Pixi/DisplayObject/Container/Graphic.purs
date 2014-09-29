module Pixi.DisplayObject.Container.Graphic where

import Pixi.Circle
import Pixi.Rectangle
import Pixi.Internal
import Pixi.DisplayObject
import Pixi.DisplayObject.Container
import Data.Foreign.OOFFI
import Control.Monad.Eff 

foreign import data Graphic    :: *
foreign import data GraphicRef :: !

instance displayObjectGraphic          :: DisplayObject Graphic
instance displayObjectContainerGraphic :: DisplayObjectContainer Graphic

newGraphic :: forall e. Eff (graphicRef :: GraphicRef | e) Graphic
newGraphic = newPixi0 "Graphics"

beginFill :: forall e. ColorHex -> Alpha -> Graphic -> Eff (render :: Render | e) Graphic
beginFill c a g = method2Eff "beginFill" g c a <:> g

-- clear :: forall e. Graphic -> Eff (render :: Render | e) Graphic
-- clear g = method0Eff "clear" g <:> g 

drawCircle :: forall e. Circle -> Graphic -> Eff (render :: Render | e) Graphic
drawCircle {radius = r, x = x, y = y} g = method3Eff "drawCircle" g x y r <:> g

-- drawEllipse 

drawRect :: forall e. Rectangle -> Graphic -> Eff (render :: Render | e) Graphic
drawRect {x = x, y = y, width = w, height = h} g = method4Eff "drawRect" g x y w h <:> g

endFill :: forall e. Graphic -> Eff (render :: Render | e) Graphic
endFill g = method0Eff "endFill" g <:> g

-- generateTexture
-- getBounds
-- lineStyle
-- lineTo
-- moveTo
-- updateBounds
