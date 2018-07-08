module Main exposing (..)

import Html exposing (..)

import Model exposing (model)
import View exposing (view)
import Update exposing (update)

main : Program Never Model.Model Update.Msg
main =
    Html.beginnerProgram { model = model, view = view, update = update }

