module Page exposing (viewPage)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)


viewContainer : List (Html msg) -> Html msg
viewContainer children =
    div
        [ css
            [ maxWidth (px 960)
            , margin2 (px 0) auto
            , displayFlex
            , alignItems center
            , justifyContent spaceBetween
            , flexWrap wrap
            ]
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
            , color (hex "fff")
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
        [ viewContainer
            [ a [ css (aCss ++ brandCss), href "/" ] [ h1 [] [ text "imtaplet" ] ]
            , nav []
                [ ul [ css ulCss ]
                    [ menu "記事" "/articles"
                    , menu "自己紹介" "/about"
                    ]
                ]
            ]
        ]


viewPage : Html msg -> Html msg
viewPage child =
    div
        [ css
            [ backgroundColor (hex "000000")
            , color (hex "FFFFFF")
            , minHeight (vh 100)
            ]
        ]
        [ viewHeader
        , main_ [] [ viewContainer [ child ] ]
        ]
