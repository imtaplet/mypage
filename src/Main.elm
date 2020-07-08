module Main exposing (main)

import ArticlePage_20200708
import Browser
import Browser.Navigation as Nav
import Html exposing (Html, a, div, dl, dt, h1, h2, header, p, text)
import Html.Attributes exposing (href)
import Url
import Url.Parser exposing ((</>), Parser, map, oneOf, s, top)


type alias Model =
    { key : Nav.Key
    , url : Url.Url
    }


type Route
    = MainPage
    | ArticlePage_20200708


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map MainPage top
        , map ArticlePage_20200708 (s "articles" </> s "20200708")
        ]


urlToRoute : Url.Url -> Maybe Route
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
    div []
        [ viewHeader
        , h2 [] [ text "自己紹介" ]
        , p [] [ viewProfile ]
        , dl []
            [ dt [] [ text "趣味" ]
            , dt [] [ text "チャットやTwitterなどのテキストコミュニケーションが趣味です。" ]
            , dt [] [ text "仕事" ]
            , dt [] [ text "現在無職で、求職中です。" ]
            ]
        , h2 [] [ text "日記" ]
        , a [ href "/articles/20200708" ] [ text ArticlePage_20200708.title ]
        ]


view : Model -> Html Msg
view model =
    case urlToRoute model.url of
        Just MainPage ->
            viewMainPage

        Just ArticlePage_20200708 ->
            ArticlePage_20200708.view

        Nothing ->
            text "404 Not Found"


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

        _ ->
            ( model, Cmd.none )


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
