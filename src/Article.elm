module Article exposing (Article, createdBy, mkArticle, viewChat, viewElm, viewPienThumbnail)

import ColorScheme exposing (..)
import Css
import Css.Media
import GlobalCss exposing (dropShadow)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)
import Html.Styled.Lazy exposing (lazy)
import Time exposing (Posix, millisToPosix)
import Url.Builder exposing (crossOrigin)


type alias ArticleMeta msg =
    { title : String
    , created : Posix
    , thumbnail : List Css.Style -> Html msg
    }


type alias Article msg =
    { meta : ArticleMeta msg
    , view : Html msg
    }


mkArticle : ArticleMeta msg -> List (Html msg) -> Article msg
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


viewPienThumbnail : List Css.Style -> String -> Html msg
viewPienThumbnail styles word =
    div
        [ css
            ([ Css.property "height" "calc((90vw - 64px) * 0.61804697157)"
             , Css.whiteSpace Css.pre
             , Css.fontSize (Css.vw 3)
             , Css.textAlign Css.center
             , Css.backgroundColor (Css.hex "EAEAEA")
             , Css.borderRadius (Css.rem 1)
             , Css.marginBottom (Css.rem 1)
             , Css.displayFlex
             , Css.justifyContent Css.center
             , Css.alignItems Css.center
             , dropShadow
             ]
                ++ styles
                ++ [ Css.Media.withMedia
                        [ Css.Media.only Css.Media.screen [ Css.Media.minWidth (Css.px 480) ] ]
                        [ Css.property "height" "calc((60vw - 64px) * 0.61804697157)"
                        ]
                   ]
            )
        ]
        [ p
            [ css
                [ Css.color (Css.hex "0f5751")
                ]
            ]
            [ text ("\u{1F97A} 「" ++ word ++ "」") ]
        ]


viewChat chatSequence =
    let
        me chat =
            dd [ attribute "data-avatar" "私" ] [ text chat ]

        boss chat =
            dt [ attribute "data-avatar" "脳内上司" ] [ text chat ]
    in
    dl []
        (chatSequence
            { me = me
            , boss = boss
            }
        )


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
