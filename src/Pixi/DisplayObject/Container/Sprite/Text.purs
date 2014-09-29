module Pixi.DisplayObject.Container.Sprite.Text where

import Pixi.Internal
import Pixi.DisplayObject
import Pixi.DisplayObject.Container
import Data.Foreign.OOFFI
import Control.Monad.Eff

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

textStyleDefault = { font            : "normal 20px Arial"
                   , fill            : "black"
                   , align           : Left
                   , stroke          : ""
                   , strokeThickness : 0
                   , wordWrap        : false
                   , wordWrapWidth   : 0 }

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

