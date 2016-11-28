module Neuron exposing (..)

{-
   sigma(z) = 1 / ( 1 + e ^ -z )
   where z = SUM(w * x - b)
-}


type Neuron n
    = Perceptron n
    | Sigmoid n


create : Float -> List Float -> (Float -> Float) -> Neuron number
create threshold weights func =
    Perceptron 5
