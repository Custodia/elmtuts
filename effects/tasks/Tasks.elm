module Main (..) where

import Html exposing (Html, text)
import Time
import Http
import Task


clockSignal : Signal Time.Time
clockSignal =
  Time.every (2 * Time.second)


mb : Signal.Mailbox String
mb =
  Signal.mailbox ""


httpTask : Task.Task Http.Error String
httpTask =
  Http.getString "http://localhost:3000/"


sendToMb : String -> Task.Task x ()
sendToMb result =
  Signal.send mb.address result


runTask : Task.Task Http.Error ()
runTask =
  Task.andThen httpTask sendToMb


taskSignal : Signal (Task.Task Http.Error ())
taskSignal =
  Signal.map (always runTask) clockSignal


view : String -> Html
view message =
  text message

main : Signal.Signal Html
main =
  Signal.map view mb.signal


port runner : Signal (Task.Task Http.Error ())
port runner =
  taskSignal
