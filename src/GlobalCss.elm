module GlobalCss exposing (snippets)

import Css exposing (..)
import Css.Global exposing (..)


snippets : List Snippet
snippets =
    [ typeSelector "h2"
        [ backgroundColor (hex "204051") ]
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
