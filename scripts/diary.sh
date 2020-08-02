#!/bin/sh

TODAY=$(date "+%Y%m%d")
UNIXTIME=$(date "+%s")
DIARY_FILENAME=src/ArticlePages/Diary$TODAY.elm

if [ ! -e $DIARY_FILENAME ]
then

echo "\
module ArticlePages.Diary$TODAY exposing (article)\n\
\n\
import Article exposing (..)\n\
import Html.Styled exposing (..)\n\
import Html.Styled.Attributes exposing (..)\n\
\n\
\n\
article : Article msg\n\
article =\n\
    let\n\
        meta =\n\
            { title = \"$(date '+%Y-%m-%d')-Diary\"\n\
            , created = createdBy $UNIXTIME\n\
            , thumbnail = text \"\u{1F97A}\"\n\
            }\n\
    in\n\
    mkArticle\n\
        meta\n\
        [ h2 [] [ text \"$(date '+%Y年%-m月%-d日')の日記\" ]\n\
        , meta.thumbnail
        , todo\n\
        ]\n\
" > $DIARY_FILENAME

fi

vim $DIARY_FILENAME
