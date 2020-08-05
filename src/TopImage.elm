module TopImage exposing (view)

import ColorScheme exposing (..)
import Css exposing (..)
import Css.Media exposing (only, screen, withMedia)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


slogan : Html msg
slogan =
    h2
        [ css
            ([ fontSize (vw 5)
             ]
                ++ [ withMedia
                        [ only screen [ Css.Media.minWidth (px 480) ] ]
                        [ fontSize (vw 2.4)
                        ]
                   ]
            )
        ]
        [ text "今日も明日も曇りで憂鬱💦"
        , br [] []
        , text "マイチュリーをモンエナで迎えよう😢"
        ]


view : Html msg
view =
    div
        [ css
            [ height (vh 80)
            , displayFlex
            , justifyContent center
            , alignItems center
            , backgroundColor baseColor1
            , color darkTextColor
            ]
        ]
        [ slogan ]
