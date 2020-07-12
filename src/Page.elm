module Page exposing (viewPage)

import Css exposing (backgroundColor, color, hex, minHeight, vh)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css, href)


viewHeader : Html msg
viewHeader =
    header []
        [ nav []
            [ a [ href "/" ] [ h1 [] [ text "imtaplet's mypage" ] ]
            , li [] [ a [ href "/articles" ] [ text "記事" ] ]
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
        , main_ [] [ child ]
        ]
