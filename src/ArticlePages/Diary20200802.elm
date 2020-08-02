module ArticlePages.Diary20200802 exposing (article)

import Article exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)


article : Article msg
article =
    let
        meta =
            { title = "2020-08-02-Diary"
            , created = createdBy 1596358214
            , thumbnail = viewPienThumbnail "デザインは、つらぽよ"
            }
    in
    mkArticle
        meta
        [ h2 [] [ text "2020年8月2日の日記" ]
        , meta.thumbnail
        , h3 [] [ text "ある日の昼下り" ]
        , dl []
            [ dt [] [ text "進捗はどうだ？" ]
            , dd [] [ text "だめです。" ]
            , dt [] [ text "納期間に合うのか？" ]
            , dd [] [ text "絶対、間に合いません。" ]
            , dt [] [ text "口より手を動かそう。" ]
            , dd [] [ text "ラジャです。" ]
            ]
        , h3 [] [ text "ウェブデザインの変更点" ]
        , p [] [ text "まだマイページとしての機能は不十分ですが、機能を作り込む前にウェブデザインを一部変更しました。" ]
        , ol []
            [ li [] [ text "ナビゲーションメニューを右上にレイアウトする。" ]
            , li [] [ text "Split Complementaryというハーモニールールで彩色する。" ]
            , li [] [ text "Split Complementaryはしっくり来なかったので、Analogousで再度彩色する。" ]
            , li [] [ text "レイアウトグリッドのためのコンテナをつけるかどうかセクションごとに任意で選べるようにする。" ]
            , li [] [ text "Web FontsでフォントとしてM PLUS Rounded 1cを設定する。" ]
            , li [] [ text "見出しにテキストアウトラインを付与して読みやすさを向上させる。" ]
            , li [] [ text "日記の日付タイトルを、より日本人に馴染みやすい表記に変更する。" ]
            , li [] [ text "自己紹介ページに「10の質問」という節を対話形式として追加する。" ]
            , li [] [ text "主要なコンテンツにボーターやドロップシャドウなどの視覚効果を付与する。" ]
            , li [] [ text "背景としてパターン画像を設定する。" ]
            , li [] [ text "見出しレベル3の先頭に、絵文字◽を付与する。" ]
            , li [] [ text "記事の枠線に光スペクトラムを模したドロップシャドウを設定する。" ]
            ]
        , p [] [ text "機能は、気が向いたら作ろうと思います。" ]
        , h3 [] [ text "次の週明け" ]
        , dl []
            [ dt [] [ text "納品できたか？" ]
            , dd [] [ text "間に合いませんでした。" ]
            , dt [] [ text "大丈夫っていってたじゃないか😠" ]
            , dd [] [ text "ぴえん\u{1F97A}" ]
            ]
        ]
