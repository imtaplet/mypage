module Main exposing (main)

import Article exposing (Article)
import Articles.ArticlePage_20200708_2
import Articles.ArticlePage_20200709
import Browser
import Browser.Navigation as Nav
import Dict
import Html exposing (Html, a, div, dl, dt, h1, h2, header, li, main_, p, text, ul)
import Html.Attributes exposing (href)
import Time
import Url
import Url.Builder exposing (relative)
import Url.Parser exposing ((</>), Parser, map, oneOf, s, string, top)


articles : Dict.Dict String (Article msg)
articles =
    [ Articles.ArticlePage_20200709.article
    , Articles.ArticlePage_20200708_2.article
    ]
        |> List.map (\article -> ( article.title, article ))
        |> Dict.fromList


articlePath : Article msg -> String
articlePath { title } =
    relative [ "articles", title ] []


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }


findArticleByTitle : String -> Maybe (Article msg)
findArticleByTitle title =
    articles
        |> Dict.get title


type Route msg
    = MainPage
    | ArticlePage (Article msg)
    | NotFoundPage


routeParser : Parser (Route msg -> a) a
routeParser =
    let
        articleOrNotFound : String -> Route msg
        articleOrNotFound title =
            case findArticleByTitle title of
                Just article ->
                    ArticlePage article

                Nothing ->
                    NotFoundPage
    in
    oneOf
        [ map MainPage top
        , map articleOrNotFound (s "articles" </> string)
        ]


urlToRoute : Url.Url -> Maybe (Route msg)
urlToRoute url =
    Url.Parser.parse routeParser url


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key url, Cmd.none )


type Msg
    = LinkClicked Browser.UrlRequest
    | UrlChanged Url.Url


viewProfile : Html msg
viewProfile =
    text """
こんばんは。imtaplet(いんたぷれっと)と申します‼
私のマイページにアクセスしていただいて、ありがとうございます。
ここには、私の学習記録や日記などを書いていく予定です。

ノートパソコンひとつで食べていけたらいいなと思って、プログラミングを勉強しています。でも私はメンタルが弱くて社会性はあまりないので、半分叶わない夢だと諦めています。
"""


viewHeader : Html msg
viewHeader =
    header []
        [ h1 [] [ text "imtaplet's mypage" ]
        ]


viewMainPage : Html Msg
viewMainPage =
    let
        articleLinks =
            articles
                |> Dict.values
                |> List.map
                    (\article ->
                        li []
                            [ a [ href (articlePath article) ] [ text article.title ]
                            ]
                    )
    in
    div []
        [ h2 [] [ text "自己紹介" ]
        , p [] [ viewProfile ]
        , dl []
            [ dt [] [ text "趣味" ]
            , dt [] [ text "チャットやTwitterなどのテキストコミュニケーションが趣味です。" ]
            , dt [] [ text "仕事" ]
            , dt [] [ text "現在無職で、求職中です。" ]
            ]
        , h2 [] [ text "日記" ]
        , ul []
            articleLinks
        ]


viewPage : Html msg -> Html msg
viewPage child =
    div []
        [ viewHeader
        , main_ [] [ child ]
        ]


view : Model -> Html Msg
view model =
    case urlToRoute model.url of
        Just MainPage ->
            viewMainPage |> viewPage

        Just (ArticlePage artcile) ->
            artcile.view |> viewPage

        Just NotFoundPage ->
            text "404 Not Found" |> viewPage

        Nothing ->
            text "404 Not Found" |> viewPage


update : Msg -> Model -> ( Model, Cmd msg )
update msg model =
    case msg of
        LinkClicked urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | url = url }
            , Cmd.none
            )


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view =
            \model ->
                { title = "imtaplet's mypage"
                , body = [ view model ]
                }
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }
