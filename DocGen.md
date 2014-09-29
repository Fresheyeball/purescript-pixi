# Module Documentation

## Module Pixi.Circle

### Types

    type Circle  = { radius :: Number, y :: Number, x :: Number }

    data PixiCircle :: *


## Module Pixi.Detector

### Types

    type Renderer  = { view :: DOM }


### Values

    appendToBody :: forall e. DOM -> Eff (domMutation :: DOMMutation | e) Unit

    autoDetectRendererImpl :: forall e. Fn2 Number Number (Eff e Renderer)

    render :: forall e. Stage -> Renderer -> Eff (render :: Render | e) Renderer


## Module Pixi.DisplayObject

### Types

    type Instrument  = forall a e. (DisplayObject a) => a -> Eff (measure :: Measure | e) Rectangle

    data InteractionData :: *

    type InteractionListener eff = forall a b e. (DisplayObject a) => a -> (InteractionData -> Eff e b) -> Eff (interaction :: eff | e) a

    data Measure :: !

    data Mouse :: !

    data Position :: !

    data StageReference :: !

    data Touch :: !


### Type Classes

    class DisplayObject a where


### Values

    click :: InteractionListener Mouse

    getBounds :: Instrument

    getLocalBounds :: Instrument

    mouseDown :: InteractionListener Mouse

    mouseOut :: InteractionListener Mouse

    mouseOver :: InteractionListener Mouse

    mouseUp :: InteractionListener Mouse

    mouseUpOutside :: InteractionListener Mouse

    setPosition :: forall a e. (DisplayObject a) => Point -> a -> Eff (position :: Position, trace :: Trace | e) a

    setPositionImpl :: forall a e. (DisplayObject a) => a -> Point -> Eff e a

    setStageReference :: forall a e. (DisplayObject a) => a -> Eff (displayObjectMutate :: StageReference | e) a

    tap :: InteractionListener Touch

    touchEnd :: InteractionListener Touch

    touchEndOutside :: InteractionListener Touch

    touchStart :: InteractionListener Touch


## Module Pixi.Internal

### Types

    data DOM :: *

    data DOMMutation :: !

    data Render :: !


### Values

    (<:>) :: forall a b e. Eff e a -> b -> Eff e b

    newPixi0 :: forall a e. String -> Eff e a


## Module Pixi.Point

### Types

    type Point  = { y :: Number, x :: Number }


## Module Pixi.Rectangle

### Types

    type Rectangle  = { height :: Number, width :: Number, y :: Number, x :: Number }


## Module Pixi.DisplayObject.Container

### Types

    data AddChild :: !

    type Alpha  = Number

    type ColorHex  = Number

    data Container :: *

    data GetChild :: !

    data RemoveChild :: !


### Type Classes

    class (DisplayObject a) <= DisplayObjectContainer a where


### Type Class Instances

    instance displayObjectContainer :: DisplayObject Container

    instance displayObjectContainerContainer :: DisplayObjectContainer Container


### Values

    addChild :: forall a b e. (DisplayObjectContainer a, DisplayObject b) => a -> b -> Eff (containerMutate :: AddChild | e) b

    addChildAt :: forall a b e. (DisplayObjectContainer a, DisplayObject b) => a -> Number -> b -> Eff (containerMutate :: AddChild | e) b

    getChildAt :: forall a b e. (DisplayObjectContainer a, DisplayObject b) => a -> Number -> Eff (containerMutate :: GetChild | e) b

    removeChild :: forall a b e. (DisplayObjectContainer a, DisplayObject b) => a -> b -> Eff (containerMutate :: RemoveChild | e) b

    removeStageReference :: forall a e. (DisplayObjectContainer a) => a -> Eff (containerMutate :: StageReference | e) a


## Module Pixi.DisplayObject.Container.Graphic

### Types

    data Graphic :: *

    data GraphicRef :: !


### Type Class Instances

    instance displayObjectContainerGraphic :: DisplayObjectContainer Graphic

    instance displayObjectGraphic :: DisplayObject Graphic


### Values

    beginFill :: forall e. ColorHex -> Alpha -> Graphic -> Eff (render :: Render | e) Graphic

    drawCircle :: forall e. Circle -> Graphic -> Eff (render :: Render | e) Graphic

    drawRect :: forall e. Rectangle -> Graphic -> Eff (render :: Render | e) Graphic

    endFill :: forall e. Graphic -> Eff (render :: Render | e) Graphic

    newGraphic :: forall e. Eff (graphicRef :: GraphicRef | e) Graphic


## Module Pixi.DisplayObject.Container.Stage

### Types

    data Color :: !

    data Stage :: *


### Type Class Instances

    instance displayObjectContainerStage :: DisplayObjectContainer Stage

    instance displayObjectStage :: DisplayObject Stage


### Values

    getMousePosition :: forall e. Stage -> Eff (interaction :: Mouse | e) Point

    newStage :: forall e. ColorHex -> Eff (newStageRef :: StageReference | e) Stage

    setBackgroundColor :: forall e. ColorHex -> Stage -> Eff (stageMutation :: Color | e) Stage


## Module Pixi.DisplayObject.Container.Sprite.Text

### Types

    data Alignment where
      Left :: Alignment
      Center :: Alignment
      Right :: Alignment

    data Text :: *

    data TextDestroy :: !

    type TextStyle  = { wordWrapWidth :: Number, wordWrap :: Boolean, strokeThickness :: Number, stroke :: String, align :: Alignment, fill :: String, font :: String }

    data TextStyleMut :: !

    data TextValueMut :: !


### Type Class Instances

    instance displayObjectContainerText :: DisplayObjectContainer Text

    instance displayObjectText :: DisplayObject Text


### Values

    newText :: forall e. String -> TextStyle -> Eff (textStyle :: TextStyleMut, textValue :: TextValueMut | e) Text

    setStyle :: forall e. TextStyle -> Text -> Eff (textStyle :: TextStyleMut | e) Text

    setText :: forall e. String -> Text -> Eff (textValue :: TextValueMut | e) Text



