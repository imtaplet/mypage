module Page exposing (wrapContainer, wrapPage)

import ColorScheme exposing (..)
import Css exposing (..)
import Css.Media exposing (only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)


wrapHeaderContainer : List (Html msg) -> Html msg
wrapHeaderContainer children =
    wrapContainerWithStyles
        [ displayFlex
        , alignItems center
        , justifyContent spaceBetween
        , flexWrap wrap
        ]
        children


wrapContainerWithStyles : List Style -> List (Html msg) -> Html msg
wrapContainerWithStyles styles children =
    div
        [ css
            ([ maxWidth (vw 90)
             , margin2 (px 0) auto
             ]
                ++ styles
                ++ [ withMedia
                        [ only screen [ Css.Media.minWidth (px 480) ] ]
                        [ maxWidth (vw 60)
                        , minWidth (px 480)
                        ]
                   ]
            )
        ]
        children


wrapContainer : List (Html msg) -> Html msg
wrapContainer children =
    wrapContainerWithStyles [] children


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
        [ wrapHeaderContainer
            [ a [ css (aCss ++ brandCss), href "/" ] [ h1 [] [ text "imtaplet" ] ]
            , nav []
                [ ul [ css ulCss ]
                    [ menu "記事" "/articles"
                    , menu "自己紹介" "/about"
                    ]
                ]
            ]
        ]


wrapPage : List (Html msg) -> Html msg
wrapPage children =
    div
        [ css
            [ color lightTextColor
            , minHeight (vh 100)
            ]
        ]
        (viewHeader
            :: children
        )
