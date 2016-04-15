module CountersContainer where

import Counter
import Html exposing (Html, div, text, button)
import Html.Attributes exposing (class)
import Html.Events exposing (onClick)

type alias Model =
  { counterOne: Int
  , counterTwo: Int
  }

initialModel: Model
initialModel =
  { counterOne = 0
  , counterTwo = 0
  }


type Action
  = CounterOne Counter.Action
  | CounterTwo Counter.Action
  | Reset
  | NoOp

update: Action -> Model -> Model
update action model =
  case action of 
    CounterOne subAction ->
      { model | 
          counterOne = Counter.update subAction model.counterOne
      }
    CounterTwo subAction ->
      { model | 
          counterTwo = Counter.update subAction model.counterTwo
      }
    Reset ->
      initialModel
    _ ->
      model


view: Signal.Address Action -> Model -> Html
view address model =
  div
    [ class "counter-container" ]
    [ Counter.view (Signal.forwardTo address CounterOne) model.counterOne 
    , Counter.view (Signal.forwardTo address CounterTwo) model.counterTwo
    , button 
        [ onClick address Reset
        , class "reset-button"
        ]
        [ text "Reset"]
    ]
