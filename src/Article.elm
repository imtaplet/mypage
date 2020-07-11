module Article exposing (Article, createdBy, mkArticle, viewElm)

import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Lazy exposing (lazy)
import Time exposing (Posix, millisToPosix)
import Url.Builder exposing (crossOrigin)


type alias ArticleMeta =
    { title : String
    , created : Posix
    }


type alias Article msg =
    { meta : ArticleMeta
    , view : Html msg
    }


mkArticle : ArticleMeta -> List (Html msg) -> Article msg
mkArticle meta content =
    { meta = meta
    , view =
        article []
            (content
                ++ [ hr [] []
                   , lazy (\_ -> viewSignature meta.created) ()
                   ]
            )
    }


createdBy : Int -> Posix
createdBy epochSeconds =
    epochSeconds
        * 1000
        |> millisToPosix


viewElm : String -> Html msg
viewElm source =
    pre [] [ code [] [ text source ] ]


viewSignature : Posix -> Html msg
viewSignature created =
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
