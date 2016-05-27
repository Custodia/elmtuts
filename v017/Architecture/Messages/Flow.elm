module Flow exposing (..)

import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Html.App


-- Model
type alias Model = Bool


init : (Model, Cmd Msg)
init =
  (False, Cmd.none)


-- Messages
type Msg
  = Expand
  | Collapse


-- View
view : Model -> Html Msg
view model =
  if model then
    div []
      [ button [ onClick Collapse ] [ text "Collapse" ]
      , text "Widget"
      ]
  else
    div []
      [ button [ onClick Expand ] [ text "Expand" ] ]


-- Update
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    Expand ->
      (True, Cmd.none)
    Collapse ->
      (False, Cmd.none)


-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.none


-- Main
main =
  Html.App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = subscriptions
    }
