module ArticlePages.Diary20200712 exposing (article)

import Article exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)


article : Article msg
article =
    mkArticle
        { title = "2020-07-12-Diary"
        , created = createdBy 1594512062
        , thumbnail = \_ -> text "\u{1F97A}"
        }
        [ h2 [] [ text "2020年7月12日の日記" ]
        , h3 [] [ text "Elm アプリケーションのSEO" ]
        , p []
            [ text "SEOのために、metaタグをいじりたかったのですが、"
            , code [] [ text "Browser.application" ]
            , text "関数で生成した Elm アプリケーションは、metaタグなどはいじれなさそうです。"
            , code [] [ text "Browser.element" ]
            , text "関数で生成した場合は、HTMLファイルに Elm を埋め込めますが、そうすると今度はページ遷移を管理できなくなります。"
            , text "自分では解決できそうにないので、詳しそうな人に聞いてみようと思います。"
            ]
        , h3 [] [ text "elm-css ファーストステップ" ]
        , p []
            [ text "重い腰をあげて、ようやくこのマイページにCSSを適用しました。"
            , text "といっても、黒背景になっただけです。"
            , text "目に優しい感じのデザインにしていければと思ってます。"
            ]
        , h3 [] [ text "自分を無能と認めること" ]
        , p []
            [ text "私は、なにか作業するとき、イライラしてしまうことが多いです。"
            , text "自分のコントロールできない範囲をコントロールしたいと思ってしまうからです。"
            , text "自分には、そんな能力はないのだから、いさぎよく自分が無能だと認めると、少しイライラが落ちつきました。"
            , text "今までも、自分は無能だと思って生きてきましたが、「これぐらいできるでしょー」などと"
            , text "思ってしまったことがあったのです。"
            ]
        , p []
            [ text "謙虚さのためや、自虐のために無能だと思いたいのではないです。"
            , text "変な執着からは、苦しみしか埋まれないと言っています。"
            , text "優秀な人間を見て、同じ人間だから、自分にもできるだろう、と安易に思ってはいけません。"
            , text "誰かが「こんな私にもできたから、あなたにもできる」という甘い罠に嵌ってはいけません。"
            , text "なにかを学習するときは、人と比べないほうが気楽です。"
            , text "昨日の自分より1mmでも成長していると思ったら、もうそれでよしとします。"
            , text "人と比べて、遅くても気にしたら苦しくなるだけです。"
            , text "ただ、やり方が悪かったなら、それは素直に受け入れようと思ってます。"
            ]
        ]
