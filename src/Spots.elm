module Spots where

import Header
import Html exposing (..)
import Html.Attributes exposing (class)
import Spot exposing (Spot)
import Effects exposing (Effects)
import ActionButton

-- MODEL

type alias Spots = List Spot


initialModel: ( Spots, Effects Action )
initialModel =
  ( [ Spot 
      "Roast Kitchen"
      "You should go here because of dat steak"
      "12 Union Ave. Brooklyn, N.Y. 12345"
    , Spot
        "Milk N' Hopts"
        "Grab a beer and a fantastic sandwhich."
        "12 Union Ave. Brooklyn, N.Y. 12345"
    , Spot
        "Joe's Pizza"
        "You should go here because of dat pizza"
        "12 Union Ave. Brooklyn, N.Y. 12345"
    ]
  , Effects.none
  )


-- UPDATE

type Action
  = AddSpot Spot
  | NoOp

update: Action -> Spots -> ( Spots, Effects Action )
update action model =
  case action of
    AddSpot spotToAdd ->
      ( List.append model [ spotToAdd ] 
      , Effects.none
      )

    _ ->
      initialModel

-- VIEW

view: Signal.Address Action -> Spots -> Html
view address model =
  div
    []
    [ Header.view "Spots"
    , div
        [ class "spots-container" ]
        ( List.append
            ( List.map (renderSpot address) model )
            [ renderAddButton address ]
        )
    ]

renderSpot: Signal.Address Action -> Spot -> Html
renderSpot address spot =
  Spot.view (Signal.forwardTo address (always NoOp)) spot

renderAddButton : Signal.Address Action -> Html
renderAddButton address =
  let
    spotToAdd =
      Spot
        "The CSS Threes Cheese Lair"
        "Yo dees dudes know a thing or 3 about cheese."
        "12 Union Ave. Brooklyn, N.Y. 12345"
  in
    ActionButton.view (Signal.forwardTo address  ( always (AddSpot spotToAdd)))
