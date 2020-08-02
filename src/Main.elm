module Main exposing (main)

import AboutPage
import Article exposing (Article)
import ArticlePages.Diary20200709
import ArticlePages.Diary20200710
import ArticlePages.Diary20200712
import ArticlePages.Diary20200713
import ArticlePages.Diary20200729
import Browser
import Browser.Navigation as Nav
import Css.Global exposing (global)
import Css.Reset exposing (ress)
import Dict
import GlobalCss
import Html.Styled exposing (Html, a, div, dl, dt, h2, li, p, section, text, toUnstyled, ul)
import Html.Styled.Attributes exposing (css, href)
import Page exposing (wrapContainer, wrapPage)
import Time
import TopImage
import Url
import Url.Builder exposing (relative)
import Url.Parser exposing ((</>), Parser, map, oneOf, s, string, top)


articles : Dict.Dict String (Article msg)
articles =
    [ ArticlePages.Diary20200709.article
    , ArticlePages.Diary20200710.article
    , ArticlePages.Diary20200712.article
    , ArticlePages.Diary20200713.article
    , ArticlePages.Diary20200729.article
    ]
        |> List.map (\article -> ( article.meta.title, article ))
        |> Dict.fromList


articlePath : Article msg -> String
articlePath article =
    relative [ "articles", article.meta.title ] []


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
    | AboutPage
    | ArticleListPage
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
        , map AboutPage (s "about")
        , map ArticleListPage (s "articles")
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


viewMainPage : Html Msg
viewMainPage =
    let
        articleLinks =
            articles
                |> Dict.values
                |> List.map
                    (\article ->
                        li []
                            [ a [ href (articlePath article) ] [ text article.meta.title ]
                            ]
                    )
    in
    div []
        [ h2 [] [ text "最近書いた日記" ]
        , ul []
            articleLinks
        ]


view : Model -> Html Msg
view model =
    case urlToRoute model.url of
        Just MainPage ->
            [ TopImage.view
            , wrapContainer [ viewMainPage ]
            ]
                |> wrapPage

        Just AboutPage ->
            [ AboutPage.view ]
                |> wrapContainer
                |> List.singleton
                |> wrapPage

        Just ArticleListPage ->
            [ viewArticleList ]
                |> wrapPage

        Just (ArticlePage artcile) ->
            [ wrapContainer [ artcile.view ] ]
                |> wrapPage

        Just NotFoundPage ->
            [ text "404 Not Found" ]
                |> wrapPage

        Nothing ->
            [ text "404 Not Found" ]
                |> wrapPage


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


viewArticleList : Html msg
viewArticleList =
    let
        viewArticles =
            articles
                |> Dict.values
                |> List.reverse
                |> List.map (\article -> article.view)
    in
    section []
        [ wrapContainer viewArticles ]


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view =
            \model ->
                { title = "imtaplet's mypage"
                , body =
                    [ global (ress ++ GlobalCss.snippets) |> toUnstyled
                    , (view >> toUnstyled) model
                    ]
                }
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = LinkClicked
        , onUrlChange = UrlChanged
        }
