module Location (..) where

import Html exposing (..)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)
import Spot exposing (Spot)


type alias Location =
  { name : String
  , spots : List Spot
  }


type Action
  = AddSpot Spot
  | RemoveSpot Spot
  | NoOp


update : Action -> Location -> Location
update action model =
  case action of
    AddSpot newSpot ->
      { model
        | spots = List.append model.spots [ newSpot ]
      }

    RemoveSpot spotToRemove ->
      { model
        | spots = List.filter (\spot -> spot /= spotToRemove) model.spots
      }

    _ ->
      model



-- VIEW


view : Signal.Address () -> Location -> Html
view address model =
  li
    [ class "location-container" ]
    [ upVote address model
    , div
        [ class "location-info-container" ]
        [ h1
            [ class "location-name" ]
            [ text model.name ]
        , div
            [ class "location-spot-breakdown" ]
            [ text "12 bars 5 resteraunt" ]
        ]
    ]


upVote : Signal.Address () -> Location -> Html
upVote address model =
  div
    [ class "sm-circle green upvote" 
    , onClick address () 
    ]
    [ div [ class "upvote-icon fa fa-angle-up" ] [] ]
