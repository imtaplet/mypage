module GlobalCss exposing (snippets)

import ColorScheme exposing (..)
import Css exposing (..)
import Css.Global exposing (Snippet, children, typeSelector)


paddingInlineStart : Length compatible units -> Style
paddingInlineStart arg1 =
    property "padding-inline-start" arg1.value


snippets : List Snippet
snippets =
    [ typeSelector "html"
        [ backgroundColor baseColor0
        , color darkTextColor
        ]
    , typeSelector "h2"
        [ textAlign center
        , color darkTextColor
        , padding2 (rem 1.0) (px 0)
        , fontSize (rem 2.0)
        ]
    , typeSelector "h3"
        [ backgroundColor mainColor2
        , color lightTextColor
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
