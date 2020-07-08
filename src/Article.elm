module Article exposing (Article)

import Html exposing (Html)
import Time


type alias Article msg =
    { title : String
    , created : Time.Posix
    , view : Html msg
    }
