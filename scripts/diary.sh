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
    mkArticle\n\
        { title = \"$(date '+%Y-%m-%d')-Diary\"\n\
        , created = createdBy $UNIXTIME\n\
        }\n\
        [ h2 [] [ text \"$(date '+%Y-%m-%d')の日記\" ]\n\
        , todo\n\
        ]\n\
" > $DIARY_FILENAME

fi

vim $DIARY_FILENAME
