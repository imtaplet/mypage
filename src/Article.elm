module Article exposing (Article, viewSignature)

import Html exposing (..)
import Time


type alias Article msg =
    { title : String
    , created : Time.Posix
    , view : Html msg
    }


viewSignature : Article msg -> Html msg
viewSignature { created } =
    span []
        [ text ("POSTED BY imtaplet AT " ++ toUtcString created)
        ]


zerofill : Int -> String
zerofill n =
    n
        |> String.fromInt
        |> String.padLeft 2 '0'


monthToInt : Time.Month -> Int
monthToInt month =
    case month of
        Time.Jan ->
            1

        Time.Feb ->
            2

        Time.Mar ->
            3

        Time.Apr ->
            4

        Time.May ->
            5

        Time.Jun ->
            6

        Time.Jul ->
            7

        Time.Aug ->
            8

        Time.Sep ->
            9

        Time.Oct ->
            10

        Time.Nov ->
            11

        Time.Dec ->
            12


toUtcString : Time.Posix -> String
toUtcString time =
    String.fromInt (Time.toYear Time.utc time)
        ++ "-"
        ++ (monthToInt >> zerofill) (Time.toMonth Time.utc time)
        ++ "-"
        ++ zerofill (Time.toDay Time.utc time)
        ++ "T"
        ++ zerofill (Time.toHour Time.utc time)
        ++ ":"
        ++ zerofill (Time.toMinute Time.utc time)
        ++ ":"
        ++ zerofill (Time.toSecond Time.utc time)
        ++ "Z"
