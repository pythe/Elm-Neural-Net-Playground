module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Perceptron exposing (Perceptron)


main : Html msg
main =
    let
        nandPerceptron =
            Perceptron 3 [ -2, -2 ]

        inputs =
            [ True, True ]

        p0 inputs =
            Perceptron.perceive nandPerceptron inputs

        sumPerceptron inputs =
            Perceptron.perceive nandPerceptron
                [ p0 inputs
                ]
    in
        div
            [ class "container" ]
            [ div
                [ class "name" ]
                [ text "NAND" ]
            , Perceptron.view nandPerceptron [ True, True ]
            ]
