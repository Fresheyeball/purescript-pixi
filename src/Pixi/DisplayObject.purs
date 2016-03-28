module Pixi.DisplayObject where

import Data.Foreign.OOFFI (method0, method1Eff, method0Eff)
import Control.Monad.Eff (Eff)
import Pixi.Rectangle (Rectangle)
import Pixi.Internal ((<:>))
import Pixi.Point (Point)

foreign import data InteractionData :: *
foreign import data Mouse :: !
foreign import data Touch :: !
foreign import data Measure :: !
foreign import data StageReference :: !
foreign import data Position :: !

class DisplayObject a

setStageReference :: forall a e. (DisplayObject a) => a -> Eff (displayObjectMutate :: StageReference | e) a
setStageReference a = method0Eff "setStageReference" a <:> a

type InteractionListener eff = forall a b e. (DisplayObject a) => a
  -> (InteractionData -> Eff e b)
  -> Eff (interaction :: eff | e) a

interactionListener :: forall a b c. String -> b -> c -> Eff a b
interactionListener name a f = method1Eff name a f <:> a

click           :: InteractionListener Mouse
click            = interactionListener "click"
mouseDown       :: InteractionListener Mouse
mouseDown        = interactionListener "mousedown"
mouseUp         :: InteractionListener Mouse
mouseUp          = interactionListener "mouseup"
mouseOver       :: InteractionListener Mouse
mouseOver        = interactionListener "mouseover"
mouseOut        :: InteractionListener Mouse
mouseOut         = interactionListener "mouseout"
mouseUpOutside  :: InteractionListener Mouse
mouseUpOutside   = interactionListener "mouseupoutside"

tap             :: InteractionListener Touch
tap              = interactionListener "tap"
touchStart      :: InteractionListener Touch
touchStart       = interactionListener "touchstart"
touchEnd        :: InteractionListener Touch
touchEnd         = interactionListener "touchend"
touchEndOutside :: InteractionListener Touch
touchEndOutside  = interactionListener "touchendoutside"

type Instrument = forall a e. (DisplayObject a) => a
  -> Eff (measure :: Measure | e) Rectangle

getBounds :: Instrument
getBounds = method0 "getBounds"

getLocalBounds :: Instrument
getLocalBounds = method0 "getLocalBounds"

foreign import setPositionImpl :: forall a e. (DisplayObject a) => a -> Point -> (Eff e a)

setPosition :: forall a e. (DisplayObject a) => Point
  -> a -> Eff (position :: Position | e) a
setPosition p a = setPositionImpl a p
