module Main exposing (main)

import AboutPage
import Article exposing (Article)
import ArticlePages.Diary20200709
import ArticlePages.Diary20200710
import ArticlePages.Diary20200712
import ArticlePages.Diary20200713
import ArticlePages.Diary20200729
import ArticlePages.Diary20200802
import ArticlePages.Diary20200803
import Browser
import Browser.Navigation as Nav
import Css
import Css.Global exposing (global)
import Css.Media
import Css.Reset exposing (ress)
import Dict
import GlobalCss
import Html.Styled exposing (Html, a, article, div, dl, dt, h2, li, p, section, text, toUnstyled, ul)
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
    , ArticlePages.Diary20200802.article
    , ArticlePages.Diary20200803.article
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
                |> List.reverse
                |> List.take 3
                |> List.map
                    (\theArticle ->
                        li
                            [ css
                                ([ Css.listStyleType Css.none
                                 , Css.width (Css.pct 100)
                                 , Css.padding (Css.vw 0.3)
                                 ]
                                    ++ [ Css.Media.withMedia
                                            [ Css.Media.only Css.Media.screen [ Css.Media.minWidth (Css.px 480) ] ]
                                            [ Css.property "width" "calc(100% / 3)"
                                            ]
                                       ]
                                )
                            ]
                            [ a
                                [ href (articlePath theArticle)
                                , css
                                    [ Css.textDecoration Css.none
                                    ]
                                ]
                                [ theArticle.meta.thumbnail
                                    ([ Css.important <| Css.property "height" "calc((100vw - 64px) * 0.61804697157)"
                                     , Css.important <| Css.fontSize (Css.vw 4)
                                     ]
                                        ++ [ Css.Media.withMedia
                                                [ Css.Media.only Css.Media.screen [ Css.Media.minWidth (Css.px 480) ] ]
                                                [ Css.important <| Css.property "height" "calc((18vw - 64px) * 0.61804697157)"
                                                , Css.important <| Css.fontSize (Css.vw 1)
                                                ]
                                           ]
                                    )
                                ]
                            ]
                    )
    in
    div
        [ css
            [ Css.backgroundImage (Css.url "\"data:image/svg+xml,%3Csvg width='40' height='40' viewBox='0 0 40 40' xmlns='http://www.w3.org/2000/svg'%3E%3Cg fill='%239C92AC' fill-opacity='0.16' fill-rule='evenodd'%3E%3Cpath d='M0 40L40 0H20L0 20M40 40V20L20 40'/%3E%3C/g%3E%3C/svg%3E\"")
            , Css.backgroundColor (Css.hex "7EB9CF")
            , Css.backgroundRepeat Css.repeat
            ]
        ]
        [ h2 [] [ text "最近書いた絵日記" ]
        , wrapContainer
            [ ul
                [ css
                    [ Css.displayFlex
                    , Css.flexWrap Css.wrap
                    ]
                ]
                articleLinks
            ]
        ]


view : Model -> Html Msg
view model =
    case urlToRoute model.url of
        Just MainPage ->
            [ TopImage.view
            , viewMainPage
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
