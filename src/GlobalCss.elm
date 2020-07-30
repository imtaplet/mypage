module GlobalCss exposing (snippets)

import Css exposing (..)
import Css.Global exposing (Snippet, children, typeSelector)


paddingInlineStart : Length compatible units -> Style
paddingInlineStart arg1 =
    property "padding-inline-start" arg1.value


snippets : List Snippet
snippets =
    [ typeSelector "h2"
        [ textAlign center
        , padding2 (rem 1.0) (px 0)
        , fontSize (rem 2.0)
        ]
    , typeSelector "h3"
        [ backgroundColor (hex "204051")
        , padding2 (rem 1.0) (rem 1.0)
        ]
    , typeSelector "article"
        [ backgroundColor (hex "073642")
        , padding4 (px 0) (rem 2.0) (rem 2.0) (rem 2.0)
        , marginTop (rem 2.0)
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
                , backgroundColor (hex "002b36")
                , color (hex "93a1a1")
                ]
            ]
        ]
    ]
