module Pixi.DisplayObject.Container.Sprite.Text where

import Prelude
import Pixi.Internal (newPixi2, (<:>))
import Pixi.DisplayObject (class DisplayObject)
import Pixi.DisplayObject.Container (class DisplayObjectContainer)
import Data.Foreign.OOFFI (method1Eff)
import Control.Monad.Eff (Eff)

foreign import data Text         :: *
foreign import data TextValueMut :: !
foreign import data TextStyleMut :: !
foreign import data TextDestroy  :: !

instance displayObjectText                :: DisplayObject Text
instance displayObjectContainerText       :: DisplayObjectContainer Text
-- instance displayObjectContainerSpriteText :: DisplayObjectContainerSprite Text

data Alignment = Left | Center | Right

type TextStyle = { font            :: String
                 , fill            :: String
                 , align           :: Alignment
                 , stroke          :: String
                 , strokeThickness :: Number
                 , wordWrap        :: Boolean
                 , wordWrapWidth   :: Number }

textStyleDefault :: TextStyle
textStyleDefault = { font            : "normal 20px Arial"
                   , fill            : "black"
                   , align           : Left
                   , stroke          : ""
                   , strokeThickness : 0.0
                   , wordWrap        : false
                   , wordWrapWidth   : 0.0
                   }

textStyleToPixi :: forall a. { align :: Alignment | a } -> { align :: String | a }
textStyleToPixi ts@{ align = Left   } = ts{ align = "left"   }
textStyleToPixi ts@{ align = Right  } = ts{ align = "right"  }
textStyleToPixi ts@{ align = Center } = ts{ align = "center" }

setText :: forall e. String -> Text -> Eff (textValue :: TextValueMut | e) Text
setText s t = method1Eff "setText" t s <:> t

setStyle :: forall e. TextStyle -> Text -> Eff (textStyle :: TextStyleMut | e) Text
setStyle ts t = method1Eff "setStyle" t ts' <:> t
  where ts' = textStyleToPixi ts

newText :: forall e. String -> TextStyle -> Eff (textValue :: TextValueMut,
                                                 textStyle :: TextStyleMut | e) Text
newText s ts = newPixi2 "Text" s $ textStyleToPixi ts

