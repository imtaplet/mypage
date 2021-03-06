module ArticlePages.Diary20200803 exposing (article)

import Article exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)


article : Article msg
article =
    let
        meta =
            { title = "2020-08-03-Diary"
            , created = createdBy 1596429080
            , thumbnail = \styles -> viewPienThumbnail styles "プログラマは、\nみんなドMって本当❓"
            }
    in
    mkArticle
        meta
        [ h2 [] [ text "2020年8月3日の絵日記" ]
        , meta.thumbnail []
        , h3 [] [ text "ある日の昼下がり" ]
        , viewChat
            (\{ boss, me } ->
                [ boss "なにかわからないことはないか❓"
                , me "プログラマは、みんなドMだって聞いたんですけど、本当ですか❓"
                , boss "だいたい当ってる。お前だって俺の言う事はなんでも聞くだろ。"
                , me "私は、なんでも言う事聞いてくれるコンピュータが好きでプログラマになったんですけど……。"
                , boss "それは、お前のドMな願望をコンピュータに自己投影してるだけだ。"
                , me "勉強になります~\u{1F97A}"
                , boss "そんな話は、どうでもいいから進捗を報告しろ。"
                ]
            )
        , h3 [] [ text "マイページの変更点" ]
        , p [] [ text "この記事は、コンテンツも elm のコードで書いてるため、機能拡張と記事のブランチは分けたほうが管理しやすいです。" ]
        , ol []
            [ li [] [ text "トップページに記事のサムネイルを使って最近の記事をリストするアレ（正式名称は不明）を追加しました。" ]
            , li [] [ text "デスクトップブラウザのように幅の広いユーザーエージェントのとき、コンテナの余白を広くしました。" ]
            ]
        , p [] [ text "本日の進捗は、以上です。" ]
        , h3 [] [ text "日が暮れて 🌃" ]
        , viewChat
            (\{ boss, me } ->
                [ boss "なるほど。"
                , me "帰っていいですか❓"
                , boss "駄目に決まってるだろ💢"
                , me "ぴえん\u{1F97A}"
                ]
            )
        ]
