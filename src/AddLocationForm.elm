module AddLocationForm where

import Header
import Html exposing (..)
import Html.Attributes exposing (class, id, type', placeholder)
import Html.Events exposing (onClick)


view: Html
view =
  div 
    []
    [ Header.view "New City"
    , form
        [ id "add-location-form"
        , class "form-container" 
        ]
        [ input
            [ id "city-input"
            , class "form-input"
            , type' "text"
            , placeholder "City Name"
            ]
            []
        ]
    ]

