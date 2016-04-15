module ActionButton where

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


view: Signal.Address () -> Html
view address =
  div
    [ class "add-button-container blue circle" 
    , onClick address ()
    ]
    [ div [ class "add-icon fa fa-plus" ] [] ]