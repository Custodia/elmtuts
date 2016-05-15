module Main (..) where

import Html exposing (Html, div)
import StartApp.Simple
import Widget as Widget


-- Model
type alias AppModel =
  { widgetModel : Widget.Model
  }


initialModel : AppModel
initialModel =
  { widgetModel = Widget.initialModel
  }


type Action
  = WidgetAction Widget.Action


-- View
view : Signal.Address Action -> AppModel -> Html
view address model =
  div
  []
  [ Widget.view (Signal.forwardTo address WidgetAction) model.widgetModel
  ]


-- Update
update : Action -> AppModel -> AppModel
update action model =
  case action of
    WidgetAction subAction ->
      let
        updatedWidgetModel =
          Widget.update subAction model.widgetModel

      in
        { model | widgetModel = updatedWidgetModel }

main : Signal.Signal Html
main =
  StartApp.Simple.start
    { model = initialModel
    , view = view
    , update = update
    }
