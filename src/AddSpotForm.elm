module AddSpotForm where

import Header
import Html exposing (..)
import Html.Attributes exposing (class, id, type', placeholder)
import Html.Events exposing (onClick)


view: Html
view =
  div 
    []
    [ Header.view "New Spot"
    , form
        [ id "add-spot-form"
        , class "form-container" 
        ]
        [ input
            [ id "spot-input" 
            , class "form-input"
            , type' "text"
            , placeholder "Name"
            ]
            []
        , input 
            [ id "spot-desciption" 
            , class "form-input"
            , type' "text"
            , placeholder "Why should I go there?"
            ]
            []
        , input 
            [ id "spot-address" 
            , class "form-input"
            , type' "text"
            , placeholder "Address"
            ]
            []
        ]
    ]

