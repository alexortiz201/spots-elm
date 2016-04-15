module Counter where

import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)


type alias Model = Int

initialModel: Model
initialModel =
  0

view: Signal.Address Action -> Model -> Html
view address model =
  div 
    [ class "main" ]
    [ button 
        [ onClick address Increase ] 
        [ text "Increase"]
    , text (toString model)
    , button 
        [ onClick address Decrease ] 
        [ text "Decrease" ]
    ]

type Action
  = Increase
  | Decrease
  | NoOp

update: Action -> Model -> Model
update action model =
  case action of
    Increase ->
      model + 1 
    Decrease ->
      model - 1
    _ ->
      model

