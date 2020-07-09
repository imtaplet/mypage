module Articles.ArticlePage_20200709 exposing (article)

import Article exposing (Article, viewSignature)
import Html as H exposing (..)
import Html.Attributes exposing (..)
import Html.Lazy exposing (lazy)
import Time exposing (millisToPosix)


article : Article msg
article =
    { title = "2020-07-09"
    , created = ((*) 1000 >> millisToPosix) 1594284704
    , view = view
    }


elm : String -> Html msg
elm source =
    pre [] [ code [] [ text source ] ]


view : Html msg
view =
    H.article []
        [ h2 [] [ text "2020-07-09の日記" ]
        , p []
            [ text "はじめての日記を書きます。この記事は、"
            , a [ href "https://elm-lang.org/" ] [ text "プログラミング言語 Elm" ]
            , text "で書きました。"
            , text "断片的ですが、今日の学びや気付きを書き綴っていこうと思います。"
            , text "技術的なことだけではなく、自分のメンタルや生活、人生観などについても書いていきたいです。"
            ]
        , h3 [] [ text "Elm でブログを書くポイント" ]
        , p []
            [ text "正しいかわかりませんが、自分ではこの書き方が書きやすいというポイントを見つけました。"
            ]
        , ul []
            [ li [] [ text "フォーマットは、フォーマッタにやらせる。" ]
            , li []
                [ text "一つの段落であっても、段落や文が長くなるときは、"
                , code [] [ text "text" ]
                , text "関数で分割する。"
                ]
            , li []
                [ text "リンクや装飾などが文中に表われたとしても、とりあえず文を書ききる。"
                , text "書ききったら、リンク化や装飾のために加工する。"
                ]
            , li []
                [ code [] [ text "Html msg" ]
                , text "を返す関数は、プレフィックスに view をつける。"
                ]
            , li []
                [ text "記事など数が多くなりうるページをモジュール分割するとき、データ構造は共通化する。"
                ]
            ]
        , p []
            [ text "記事のビューとタイトルをまとめて一つのレコード型にして、一箇所に記事をまとめておくと追加しやすくなります。"
            , text "記事一覧などしたい場合は、次のように"
            , code [] [ text "List" ]
            , text "やら"
            , code [] [ text "Dict" ]
            , text "やらでまとめておくと良さそうです。"
            ]
        , elm """
import ArticlesPage.ArticlePage_20200709

...

articlePages : Dict.Dict String (ArticlePage msg)
articlePages =
    [ ArticlePages.ArticlePage_20200709.articlePage
    ]
        |> List.map (\\article -> ( article.title, article ))
        |> Dict.fromList
        """
        , p []
            [ text "記事のレコードには、投稿日時も追加しています。"
            ]
        , elm """
articlePage : ArticlePage msg
articlePage =
    { title = "Today's diary"
    , created = ((*) 1000 >> millisToPosix) 1594284704 -- 投稿日時
    , view = view
    }
        """
        , p []
            [ text "vim を使っている場合は、"
            , code [] [ text ":r!echo $EPOCHSECONDS" ]
            , text "コマンドを使えばカーソル位置にPOSIXタイムを挿入できます。"
            , text "頑張れば、yyyy-MM-dd のような書式で投稿日時を記述できるかもしれませんが、"
            , text "その解析はブラウザ上で行なわれるためパフォーマンスのためにUNIXタイムをそのまま記述しています。"
            , text "日時だけに限らず、プリプロセスできるものは、できるだけプリプロセスしておいたほうがよいという考えです。"
            , text "秒からミリ秒への変換もプリプロセスできると理想ですが、それはあきらめました。"
            ]
        , p []
            [ text "動きのない単調な文書であれば、 Elm より MarkdownやAsciiDoc、Re:VIEW などの軽量マークアップ言語を使ったほうが書きやすいかもしれません。"
            , text "なにか動きをつけたいから、 Elm のほうが良いかもしれません。"
            , text "ブログを Elm で書くというアイディアは、思いついたときは良いアイディアだと思ったのですが、実際にやってみると悪いアイディアに思えてきました。"
            , text "ただ、まだ学びはあるかなと思うので、日記も気力が続く限りは書いてみようと思います。"
            ]
        , p []
            [ text "私は、Elm に慣れていないので、たまに書き方がわからないシチュエーションに遭遇します。"
            , text "練習をつづけて、このようなことがなくなればラッキーです。"
            ]
        , h3 [] [ text "メンタルの状態について" ]
        , p []
            [ text "一日に何度も、死にたいと考えます。でも自殺は、大変痛みと恐怖を伴う行為です。"
            , text "ビルから飛びおりるだけと思うかもしれませんが、そんなこと易々できるクレージーな人はあまりいないかと思います。"
            , text "少なくとも、私は違います。"
            , text "安楽死を選ぶ場合は、安楽死大国であるオランダやスイスへの渡航というかなり金銭的コストの高い手段を選ぶしかありません。"
            , text "そんなお金も行動力もないので、こうして死ねずに、ただ無駄に生きています。"
            ]
        , p []
            [ text "なにか生きる喜びがあれば、よいかなと思うこともあります。"
            , text "しかし、基本的には、なにをしても楽しいと思えません。"
            , text "ただ、プログラミングのように頭の使う作業をしていれば、苦痛を一時忘れられます。"
            , text "これもずっとは続きません。私は、体の体力と同様、知的な作業をする体力もないので、プログラミングをしているとすぐ疲れてしまいます。"
            ]
        , p []
            [ text "悩みの中には、些細なものもあります。"
            , text "たとえば、毎朝頭痛で目が覚めることや、パソコンの設定を上手くできないことです。"
            , text "塵も積れば山となる、といった感覚でこれらも死にたくなる一つの要因です。"
            , text "頑張れば解決できる悩みもあるかもしれませんが、それを解決しようとしている最中に、すぐに新しい悩みが生れてしまいます。"
            , text "気づいたら、頭の中は、ノイズだらけです。"
            ]
        , h3 [] [ text "将来、マイページでやっていきたいこと" ]
        , p []
            [ text "このマイページに、いくつかの機能を追加して便利にしていきたいと思っています。"
            , text "現在は、次のような機能を考えています。"
            ]
        , ul []
            [ li [] [ text "自動読み上げや拡大モードなどアクセシビリティを向上させる機能" ]
            , li [] [ text "このウェブサイトを閲覧しているあなたが私とインタラクティブに対話できる機能" ]
            , li [] [ text "SVGを使って視覚的に伝えたいことを記述する機能" ]
            , li [] [ text "ソースコードを埋め込んで、その場で実行できる機能" ]
            ]
        , p []
            [ text "高いアクセシビリティと良い外観を両立できるデザインにできたらと思います。"
            , text "やりたいことが増えたら、そのうちサーバーサイドを要求されるかもしれません。"
            , text "そうなったら、どの言語を選択するか悩ましいです。"
            ]
        , hr [] []
        , lazy (\_ -> viewSignature article) ()
        ]
