module GlobalCss exposing (snippets)

import Css exposing (..)
import Css.Global exposing (..)


snippets : List Snippet
snippets =
    [ typeSelector "h2"
        [ backgroundColor (hex "204051") ]
    ]
