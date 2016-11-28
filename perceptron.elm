module Perceptron exposing (Perceptron, perceive, view)

import List.Extra as List
import Svg exposing (..)
import Svg.Attributes exposing (..)


type alias Perceptron =
    { bias : Float
    , weights : List Float
    }


perceive : Perceptron -> List Bool -> Bool
perceive perceptron inputs =
    inputs
        |> List.map floatify
        |> List.zip perceptron.weights
        |> List.map (\( w, i ) -> w * i)
        |> List.sum
        |> (>) perceptron.bias


floatify : Bool -> Float
floatify i =
    case i of
        True ->
            1.0

        False ->
            0.0



-- View


view : Perceptron -> List Bool -> Svg msg
view p inputs =
    svg
        [ class "perceptron" ]
        [ g
            [ stroke "black"
            , fill "white"
            , color "black"
            ]
            (circle
                [ cx "100"
                , cy "50"
                , r "30"
                ]
                [ text <| toString <| perceive p inputs ]
                :: inputsToLines inputs
            )
        ]


inputsToLines : List Bool -> List (Svg msg)
inputsToLines inputs =
    inputs
        |> List.map floatify
        |> List.indexedMap (inputToLine <| List.length inputs)


inputToLine : Int -> Int -> Float -> Svg msg
inputToLine count index input =
    line
        [ x1 "0"
        , y1 <| toString (50 / (toFloat count - 1) * (toFloat index))
        , x2 "70"
        , y2 "50"
        ]
        [ text <| toString input ]
