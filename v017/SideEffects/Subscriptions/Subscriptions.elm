module Main exposing (..)

import Html exposing (Html, div, text)
import Html.App
import Mouse
import Keyboard


-- Model
type alias Model = Int

init : (Model, Cmd Msg)
init =
  (0, Cmd.none)


-- Messages
type Msg
  = MouseMsg Mouse.Position
  | KeyMsg Keyboard.KeyCode


-- View
view : Model -> Html Msg
view model =
  div []
    [ text (toString model) ]


-- Update
update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
  case msg of
    MouseMsg _ ->
      (model + 1, Cmd.none)

    KeyMsg _ ->
      (model + 2, Cmd.none)


-- Subscriptions
subscriptions : Model -> Sub Msg
subscriptions model =
  Sub.batch
    [ Mouse.clicks MouseMsg
    , Keyboard.presses KeyMsg
    ]


-- Main
main =
  Html.App.program
  { init = init
  , view = view
  , update = update
  , subscriptions = subscriptions
  }
