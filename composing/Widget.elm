module Widget (..) where

import Html exposing (Html, div, text, button)
import Html.Events as Events


-- Model
type alias Model =
  { count: Int
  }


initialModel : Model
initialModel =
  { count = 0
  }


type Action
  = Increase


-- View
view : Signal.Address Action -> Model -> Html
view address model =
  div
    []
    [ div [] [ text (toString model.count)]
    , button
      [ Events.onClick address Increase ]
      [ text "Click"]
    ]

-- Update
update : Action -> Model -> Model
update action model =
  case action of
    Increase ->
      { model | count = model.count + 1 }
