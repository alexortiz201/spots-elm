module Spot (..) where

import Html exposing (Html, div, h1, text, p, h3)
import Html.Attributes exposing (class)


-- MODEL


type alias Spot =
  { name : String
  , description : String
  , location : String
  }


-- UPDATE


type Action
  = UpdateDescription String
  | UpdateName String
  | UpdateLocation String


update : Action -> Spot -> Spot
update action model =
  case action of
    UpdateDescription newDescription ->
      { model | description = newDescription }

    UpdateName newName ->
      { model | name = newName }

    UpdateLocation newLocation ->
      { model | location = newLocation }



-- VIEW


view : Signal.Address Action -> Spot -> Html
view address model =
  div
    [ class "spot-container" ]
    [ h1
        [ class "spot-name" ]
        [ text model.name ]
    , p
        [ class "spot-description" ]
        [ text model.description ]
    , p
        [ class "spot-location" ]
        [ text model.location ]
    ]
