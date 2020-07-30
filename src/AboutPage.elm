module AboutPage exposing (view)

import Html.Styled exposing (..)


view : Html msg
view =
    article []
        [ h2 [] [ text "自己紹介" ]
        , p [] [ viewProfile ]
        , dl []
            [ dt [] [ text "趣味" ]
            , dt [] [ text "チャットやTwitterなどのテキストコミュニケーションが趣味です。" ]
            , dt [] [ text "仕事" ]
            , dt [] [ text "現在無職で、求職中です。" ]
            ]
        ]


viewProfile : Html msg
viewProfile =
    text """
こんばんは。imtaplet(いんたぷれっと)と申します‼
私のマイページにアクセスしていただいて、ありがとうございます。
ここには、私の学習記録や日記などを書いていく予定です。

ノートパソコンひとつで食べていけたらいいなと思って、プログラミングを勉強しています。でも私はメンタルが弱くて社会性はあまりないので、半分叶わない夢だと諦めています。
"""
