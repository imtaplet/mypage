module ArticlePages.Diary20200713 exposing (article)

import Article exposing (..)
import Css exposing (..)
import Html.Styled exposing (..)
import Html.Styled.Attributes exposing (..)


article : Article msg
article =
    mkArticle
        { title = "2020-07-13-Diary"
        , created = createdBy 1594642199
        , thumbnail = text "\u{1F97A}"
        }
        [ h2 [] [ text "2020年7月13日の日記" ]
        , h3 [] [ text "バグの修正についての工数見積" ]
        , p []
            [ text "バグの見積には調査が必要です。"
            , text "でも、その調査すら見積れないのではないか？ という疑問がありました。"
            , text "時間とお金の話は、怖いです。ウソをついたら血祭りになるかもしれません。"
            ]
        , blockquote
            [ class "twitter-tweet"
            , css [ border3 (px 1) solid (hex "FFF") ]
            ]
            [ p [ Html.Styled.Attributes.lang "ja", dir "ltr" ]
                [ text "現役プログラマの人に聞きたい‼️"
                , br [] []
                , br [] []
                , text "バグの修正、どのぐらいかかるか聞かれたら、なんて答えるの❓"
                , br [] []
                , br [] []
                , text "その時点でバグの原因はわからないとき。"
                , text "— いんたっぷれっと (@imtaplet) "
                , a [ href "https://twitter.com/imtaplet/status/1282455425225355266?ref_src=twsrc%5Etfw" ]
                    [ text "July 12, 2020" ]
                ]
            ]
        , node "script"
            [ attribute "async" ""
            , src "https://platform.twitter.com/widgets.js"
            , attribute "charset" "utf-8"
            ]
            []
        , p []
            [ text "Twitterで質問したら、多くの方に回答いただけました。ありがとうございます。"
            , text "興味深い回答、コメントがあったのでいくつかピックアップして、再度ここで反芻しようと思います。"
            ]
        , ol []
            [ li [] [ text "n時間いただき、n 時間後に回答する。" ] -- 1
            , li [] [ text "(n + buffer)時間いただき、n 時間後に回答する。" ] -- 2
            , li [] [ text "調査しないと、工数見積できない。" ] -- 3
            , li [] [ text "時間とお金は一人歩きするので、慎重に出すべき。" ] -- 4
            , li [] [ text "なぜ工数見積が必要か理由を聞く。" ] -- 5
            , li [] [ text "工数見積できない理由を説明する。" ] -- 6
            , li [] [ text "逆ギレする。" ] -- 7
            ]
        , p []
            [ text "1. の「n時間いただき、n 時間後に回答する。」は、勘が働くなら良さそうです。"
            , text "しかし、もし悲観的に勘は当たらないとしたら謝罪が発生してしまいます。"
            , text "2. の「(n + buffer)時間いただき、n 時間後に回答する。」は、n がわからない問題は依然ありますが、シートベルトのように身を守ってくれるかもしれません。"
            , text "ただ、バッファーというのは不思議なものでいくらでも積んでしまうし、よっぽど大丈夫だと思ったときに限ってオーバーしてしまいます。"
            , text "議論のため、「謝罪は、したくない」として、話を進めてみます。"
            ]
        , p []
            [ text "3. の「調査しないと、工数見積できない」は、まさにそうなんです。"
            , text "言葉を濁してしまっても一旦持ちかえるのが安全かもしれません。"
            , text "まさにそれは、4. の「時間とお金は一人歩きするので、慎重に出すべき」だからです。"
            ]
        , p []
            [ text "さらに議論するために、持ち帰りせずに回答できる方法を考えてみます。"
            , text "5. 「なぜ工数見積が必要か理由を聞く」は、ラッキパターンの場合は、バクチをうたずに済みそうです。"
            , text "ワンチャンあるので、理由を聞くということは大事ですね。"
            , text "では、次にワンチャンなかった場合を考えます。"
            ]
        , p []
            [ text "6. 「工数見積できない理由を説明する。」は、よさそうです。"
            , text "しかし、明言しない人というレッテルを貼られる可能性はありそうです。"
            , text "不条理ですね。明言を避けられるなら、すべて明言しない人生を送りたいです。"
            , text "仮の話として、顧客は選べないものとします。"
            ]
        , p []
            [ text "7. 「逆ギレする」は、ちょっとシュールですが、通用する相手であればアリかもしれません。"
            , text "自分のポジションが相手より優位であるときは、特に有効だと思いました。"
            , text "そうでなかった場合は、逆ギレしたら、ひどい目にあいそうですが、日頃から自分のポジションをあげておくことも必要なのかもしれません。"
            ]
        ]
