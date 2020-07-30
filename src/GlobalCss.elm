module GlobalCss exposing (snippets)

import Css exposing (..)
import Css.Global exposing (Snippet, children, typeSelector)


paddingInlineStart : Length compatible units -> Style
paddingInlineStart arg1 =
    property "padding-inline-start" arg1.value


snippets : List Snippet
snippets =
    [ typeSelector "h2"
        [ backgroundColor (hex "204051") ]
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
                ]
            ]
        ]
    ]