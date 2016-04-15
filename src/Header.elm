module Header (..) where

import Html exposing (..)
import Html.Attributes exposing (class)


type alias Title = 
    String

view: Title -> Html
view title =
  div
    [ class "header-container" ]
    [ div [ class "header" ] [text title] ]
