module Main (..) where

import Html exposing (..)
import Effects exposing (Effects, Never)
import Task
import StartApp


-- Actions
type Action
  = NoOp


-- Model
type alias Model =
  {}


initialModel : Model
initialModel =
  {}


-- Update
update : Action -> Model -> (Model, Effects Action)
update action model =
  (model, Effects.none)


--View
view : Signal.Address Action -> Model -> Html
view address model =
  div
    []
    [ text "Hello" ]


-- Start app
init : (Model, Effects Action)
init =
  (initialModel, Effects.none)


app : StartApp.App Model
app =
  StartApp.start
    { init = init
    , inputs = []
    , update = update
    , view = view
    }


main : Signal.Signal Html
main =
  app.html


port runner : Signal (Task.Task Never ())
port runner =
  app.tasks
