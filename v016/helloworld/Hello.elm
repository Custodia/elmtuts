module Greeting exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

-- MAIN
main : Html a
main = view model

-- MODEL
model : String
model = "World"

-- VIEW
view : String -> Html a
view person =
  div []
    [ h2 [] [ text ("Todo List For: " ++ person) ]
    , ul []
      [ li [] [ text "Sample Todo Item"]
      ]
    , input
      [type' "text"
      , placeholder "New Todo Item"
      ] []
    , button [] [ text "Add Item" ]
    ]
