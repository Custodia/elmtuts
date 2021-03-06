module Widget exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


-- Model
type alias Model =
  { count : Int
  }


initialModel =
  { count = 0
  }


type Msg
  = Increase


-- View
view : Model -> Html Msg
view model =
  div
    []
    [ div [] [ text (toString model.count) ]
    , button [ onClick Increase ] [ Html.text "Click" ]
    ]


-- Update
update : Msg -> Model -> (Model, Cmd Msg)
update message model =
  case message of
    Increase ->
      ({model | count = model.count + 1 }, Cmd.none)
