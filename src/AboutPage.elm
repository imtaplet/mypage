module AboutPage exposing (view)

import Css exposing (..)
import Html.Styled exposing (..)


view : Html msg
view =
    let
        faq question answer =
            [ dt [] [ text question ]
            , dd [] [ text answer ]
            ]

        faqList =
            [ faq "No.1 あなたのハンドルネームは？" "imtaplet （いんたっぷれっと）です❗\n長いと思う方は、'いんたぷ' と呼んでください❗"
            , faq "No.2 どこに住んでますか？" "amazon の届く地理です。\n故郷は、インターネットだと思うようにしています。"
            , faq "No.3 好きな食べ物は？" "マイスリー\u{1F7E0}"
            , faq "No.4 職業は？" "闘病中のためニートですが、\n本人はプログラマだと思いこんでる模様です\u{1F914}"
            , faq "No.5 恋人はいますか？" "恋人は、マイスリーです。\n辛いときも悲しいときも一緒にいてくれました✨"
            , faq "No.6 あなたの口ぐせはなに？" "「もうだめだ😨」"
            , faq "No.7 長所はなに？" "マイスリーとモンエナを入力にクソコードを出力できる。"
            , faq "No.8 短所はなに？" "すぐ寝る😴"
            , faq "No.9 人に言えない秘密はなに？" "基本、死ぬことしか考えてない。"
            , faq "No.10 自分について何でもいいので語ってください。" "悲観的で落ち込みやすい性格です。\n極端なこだわりや強迫観念も強いので生きるのが辛いです。"
            ]
                |> List.concat
    in
    article []
        [ h2 [] [ text "自己紹介" ]
        , p [] [ viewProfile ]
        , h3 [] [ text "10の質問" ]
        , dl [] faqList
        ]


viewProfile : Html msg
viewProfile =
    text """
こんばんは。imtaplet(いんたぷれっと)と申します‼
私のマイページにアクセスしていただいて、ありがとうございます。
ここには、私の学習記録や日記などを書いていく予定です。

ノートパソコンひとつで食べていけたらいいなと思って、プログラミングを勉強しています。でも私はメンタルが弱くて社会性はあまりないので、半分叶わない夢だと諦めています。
"""
