module GlobalCss exposing (snippets)

import ColorScheme exposing (..)
import Css exposing (..)
import Css.Global exposing (Snippet, children, typeSelector)


paddingInlineStart : Length compatible units -> Style
paddingInlineStart arg1 =
    property "padding-inline-start" arg1.value


textOutline : Length compatible units -> Color -> Style
textOutline blurRadius color =
    property "text-shadow"
        ([ "1px 1px " ++ blurRadius.value ++ " " ++ color.value
         , "-1px 1px " ++ blurRadius.value ++ " " ++ color.value
         , "1px -1px " ++ blurRadius.value ++ " " ++ color.value
         , "-1px -1px " ++ blurRadius.value ++ " " ++ color.value
         ]
            |> String.join ","
        )


snippets : List Snippet
snippets =
    [ typeSelector "html"
        [ backgroundColor baseColor0
        , color darkTextColor
        , fontFamilies [ qt "M PLUS Rounded 1c" ]
        , fontWeight bold
        ]
    , typeSelector "h2"
        [ textAlign center
        , color darkTextColor
        , textOutline (px 2) (hex "FFF")
        , whiteSpace noWrap
        , padding2 (rem 1.0) (px 0)
        , fontSize (rem 2.0)
        ]
    , typeSelector "h3"
        [ backgroundColor mainColor2
        , color lightTextColor
        , borderRadius (rem 1.0)
        , textOutline (px 2) (hex "16B4E9")
        , padding2 (rem 1.0) (rem 1.0)
        ]
    , typeSelector "p"
        [ color darkTextColor
        ]
    , typeSelector "article"
        [ nthOfType "n+2"
            [ marginTop (rem 2.0)
            ]
        ]
    , typeSelector "article"
        [ backgroundColor mainColor0
        , color darkTextColor
        , border3 (px 16) solid articleBorderColor
        , borderRadius (rem 1.0)
        , padding4 (px 0) (rem 2.0) (rem 2.0) (rem 2.0)
        ]
    , typeSelector "p"
        [ margin2 (em 1.0) (px 0) ]
    , typeSelector "ol"
        [ paddingInlineStart (em 1.0) ]
    , typeSelector "ul"
        [ paddingInlineStart (em 1.0) ]
    , typeSelector "pre"
        [ children
            [ typeSelector "code"
                [ display block
                , overflow scroll
                , width (pct 100)
                , backgroundColor codeBackgroundColor
                , color codeTextColor
                ]
            ]
        ]
    ]
