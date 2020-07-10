#!/bin/sh

TODAY=$(date "+%Y%m%d")
DIARY_FILENAME=src/ArticlePages/Diary$TODAY.elm

if [ ! -e $DIARY_FILENAME ]
then

echo " \
module ArticlePages.Diary$TODAY exposing (article) \
 \n \
import Article exposing (..) \n \
import Html as H exposing (..) \n \
import Html.Attributes exposing (..) \n \
import Html.Lazy exposing (lazy) \n \
 \n \
 \n \
article : Article msg \n \
article = \n \
    { title = \"$(date '+%Y-%m-%d')-Diary\" \n \
    , created = createdBy $(echo $EPOCHSECONDS) \n \
    , view = view \n \
    } \n \
 \n \
 \n \
view : Html msg \n \
view = \n \
    H.article [] \n \
        [ h2 [] [ text \"$(date '+%Y-%m-%d')の日記\" ] \n \
        , p [] \n \
            [ todo ] \n \
            " > $DIARY_FILENAME

fi

vim $DIARY_FILENAME
