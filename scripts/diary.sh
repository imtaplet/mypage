#!/bin/sh

TODAY=$(date "+%Y%m%d")
UNIXTIME=$(date "+%s")
DIARY_FILENAME=src/ArticlePages/Diary$TODAY.elm

if [ ! -e $DIARY_FILENAME ]
then

cat <<EOS > $DIARY_FILENAME
module ArticlePages.Diary$TODAY exposing (article)

import Article exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)


article : Article msg
article =
    let
        meta =
            { title = "$(date '+%Y-%m-%d')-Diary"
            , created = createdBy $UNIXTIME
            , thumbnail = \_ -> viewPienThumbnail [] todo
            }
    in
    mkArticle
        meta
        [ h2 [] [ text "$(date '+%Y年%-m月%-d日')の絵日記" ]
        , meta.thumbnail []
        , todo
        ]
EOS

fi

vim $DIARY_FILENAME
