module Page exposing (viewPage)

import Css exposing (backgroundColor, color, hex, minHeight, vh)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


viewHeader : Html msg
viewHeader =
    header []
        [ h1 [] [ text "imtaplet's mypage" ]
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
