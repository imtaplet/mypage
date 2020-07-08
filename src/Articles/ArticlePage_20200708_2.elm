module Articles.ArticlePage_20200708_2 exposing (article)

import Article exposing (Article)
import Html exposing (..)
import Time exposing (millisToPosix)


article : Article msg
article =
    { title = "2020-07-08-2"
    , created = millisToPosix 1594187973
    , view = view
    }


view : Html msg
view =
    text "サンプルの記事です2"
