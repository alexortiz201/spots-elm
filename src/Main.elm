module Main (..) where

--import CountersContainer

import Html exposing (Html)
import Effects exposing (Effects, Never)
import StartApp exposing (start)
import Task
import Locations exposing (Locations)
import Spots exposing (Spots)
import AddLocationForm
import AddSpotForm


-- MODEL


type alias Model =
  { locations : Locations
  }


initialModel : Model
initialModel =
  { locations = Locations.initialModel
  }



-- UPDATE


type Action
  = LocationsAction Locations.Action
  | NoOp


update : Action -> Model -> ( Model, Effects Action )
update action model =
  case action of
    LocationsAction subAction ->
      let
        ( updatedLocations, fx ) =
          Locations.update subAction model.locations
      in
        ( { model
            | locations = updatedLocations
          }
        , Effects.map LocationsAction fx
        )

    _ ->
      ( initialModel, Effects.none )



-- VIEW


view : Signal.Address Action -> Model -> Html
view address model =
  Locations.view (Signal.forwardTo address LocationsAction) model.locations



-- Use StartApp to wire things up.


app =
  start
    { init = ( initialModel, Effects.none )
    , inputs = []
    , view = view
    , update = update
    }

--start
--  { init = Spots.initialModel
--  , inputs = []
--  , view = Spots.view
--  , update = Spots.update
--  }


main =
  app.html



-- Set up a port to run the tasks from our app


port runner : Signal (Task.Task Never ())
port runner =
  app.tasks
