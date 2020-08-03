module ArticlePages.Diary20200710 exposing (article)

import Article exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)


article : Article msg
article =
    mkArticle
        { title = "2020-07-10-Diary"
        , created = createdBy 1594349952
        , thumbnail = \_ -> text "\u{1F97A}"
        }
        [ h2 [] [ text "2020年7月10日の絵日記" ]
        , p []
            [ text "日記を Elm で書くのは、良いアイディアかもしれません。"
            , text "毎日言うこと変わってますね😅(セルフツッコミ)"
            ]
        , p []
            [ text "なぜ、そう思ったかというと記事を書くだけで、関数を抽出する練習になるからです。"
            , text "共通する部分を纏めるという単純な話ではありません。"
            , text "コードのある部分をピックアップして、そのコードが示す概念にわかりやすい名前をつけるという作業です。"
            ]
        , h3 [] [ text "シェルスクリプトで記事の Elm ファイルを生成する" ]
        , p []
            [ text "ボイラープレートは嫌いです。"
            , text "でも、良い方法が思い浮かばなかったので、シェルスクリプトでボイラープレートを生成することにしました。"
            , text "👉"
            , a [ target "_blank", rel "noopener", href "https://github.com/imtaplet/mypage/blob/master/scripts/diary.sh" ] [ text "diary.sh" ]
            , text "このスクリプトを実行したとき、もし既存の記事ファイルがあったら、そのファイルをエディタで開く仕様です。"
            , text "記事ファイルが大量にあっても、今日の記事を更新するときは同じコマンドを叩けばよいのです。"
            , text "このようにすれば、今日何日で、ファイル名はなんだっけ？といったようにファイルを探す必要がありません。"
            ]
        , p []
            [ text "シェルスクリプトにコードを埋め込んでるため、フォーマッターは使えないし、ハイライトもありません。"
            , text "したがって、埋め込むコードは最小限になるように工夫しました。"
            , text "でも、一度生成した記事ファイルは簡単には変えられないので変更に弱い可能性もあります。"
            , text "記事を追加していくごとに、そのリスクは高まります。"
            , text "この問題を、どのように解決するかまだ答えを見つけられていません。"
            , text "しかし、Elmは、型チェックがあるので、壊れた記事ファイルをそのままデプロイしてしまうという最悪の事態は避けられそうです。"
            ]
        ]
