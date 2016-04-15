module Locations (..) where

import Location exposing (Location)
import Header
import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Effects exposing (Effects)
import AddLocationForm
import ActionButton


-- MODEL
-- Our model is a list of Location components


type alias Locations =
  List Location



-- Our initial model is a tuple


initialModel : Locations
initialModel =
  [ Location "New York City" []
  , Location "Seattle" []
  , Location "Paris" []
  ]



-- UPDATE
-- A Union type of possible actions.


type Action
  = AddLocation Location
    -- Move a location to top
  | PromoteLocation Location
  | NoOp


update : Action -> Locations -> ( Locations, Effects Action )
update action model =
  case action of
    AddLocation location ->
      ( location :: model
      , Effects.none
      )

    PromoteLocation locationToPromote ->
      ( locationToPromote :: (List.filter (\location -> location /= locationToPromote) model)
      , Effects.none
      )

    _ ->
      ( initialModel, Effects.none )



-- VIEW


view : Signal.Address Action -> Locations -> Html
view address model =
  div
    []
    [ Header.view "Locations"
    , ul
        [ class "location-list" ]
        (List.append
          (List.map (renderLocation address) model)
          [ renderAddButton address ]
        )
    ]


renderLocation : Signal.Address Action -> Location -> Html
renderLocation address model =
  Location.view (Signal.forwardTo address (always (PromoteLocation model))) model


renderAddButton : Signal.Address Action -> Html
renderAddButton address =
  ActionButton.view (Signal.forwardTo address (always (AddLocation (Location "Gotham" []))))
