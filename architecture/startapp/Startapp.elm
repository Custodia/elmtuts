module Main (..) where

import Html exposing (Html, div, button, text)
import Html.Events as Events
import StartApp.Simple

type alias Model =
  { count: Int
  }


type Action
  = NoOp
  | Increase

initialModel : Model
initialModel =
  { count = 0
  }

view : Signal.Address Action -> Model -> Html
view address model =
  div
    []
    [ div [] [ text (toString model.count) ]
    , button
      [ Events.onClick address Increase ]
      [text "Click"]
    ]


update : Action -> Model -> Model
update action model =
  case action of
    Increase ->
      { model | count = model.count + 1 }

    _ ->
      model

main : Signal.Signal Html
main =
  StartApp.Simple.start
    { model = initialModel
    , view = view
    , update = update
    }
