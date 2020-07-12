module Page exposing (viewPage)

import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)


viewContainer : List (Html msg) -> Html msg
viewContainer children =
    div
        [ css
            [ width (px 960)
            , margin2 (px 0) auto
            ]
        ]
        children


viewHeader : Html msg
viewHeader =
    header []
        [ viewContainer
            [ nav []
                [ a [ href "/" ] [ h1 [] [ text "imtaplet's mypage" ] ]
                , ul []
                    [ li [] [ a [ href "/articles" ] [ text "記事" ] ]
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
