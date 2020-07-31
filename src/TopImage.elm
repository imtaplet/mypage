module TopImage exposing (view)

import ColorScheme exposing (..)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (css)


slogan : Html msg
slogan =
    h2
        []
        [ text "今日も明日も曇りで憂鬱💦"
        , br [] []
        , text "マイスリーをモンエナで迎えよう😢"
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
