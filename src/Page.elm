module Page exposing (viewPage)

import ColorScheme exposing (..)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)


viewHeaderContainer : List (Html msg) -> Html msg
viewHeaderContainer children =
    viewContainer
        [ displayFlex
        , alignItems center
        , justifyContent spaceBetween
        , flexWrap wrap
        ]
        children


viewContainer : List Style -> List (Html msg) -> Html msg
viewContainer styles children =
    div
        [ css
            ([ maxWidth (vw 90)
             , margin2 (px 0) auto
             ]
                ++ styles
            )
        ]
        children


viewHeader : Html msg
viewHeader =
    let
        brandCss =
            [ height (rem 6.0)
            , paddingTop (px 35)
            ]

        aCss =
            [ textDecoration none
            , color lightTextColor
            , paddingLeft (rem 2.0)
            ]

        liCss =
            [ display inline
            , fontWeight bold
            ]

        ulCss =
            [ margin3 (rem 1) (px 0) (rem 0.5)
            , textAlign center
            ]

        menu title link =
            li [ css liCss ] [ a [ css aCss, href link ] [ text title ] ]
    in
    header []
        [ viewHeaderContainer
            [ a [ css (aCss ++ brandCss), href "/" ] [ h1 [] [ text "imtaplet" ] ]
            , nav []
                [ ul [ css ulCss ]
                    [ menu "記事" "/articles"
                    , menu "自己紹介" "/about"
                    ]
                ]
            ]
        ]


viewPage : List (Html msg) -> Html msg -> Html msg
viewPage children mainChild =
    let
        containeredChildren =
            children
                |> List.map (\child -> viewContainer [] [ child ])

        containeredMain =
            main_ [] [ viewContainer [] [ mainChild ] ]
    in
    div
        [ css
            [ color lightTextColor
            , minHeight (vh 100)
            ]
        ]
        (viewHeader
            :: containeredChildren
            ++ [ containeredMain ]
        )
