module GlobalCss exposing (snippets)

import ColorScheme exposing (..)
import Css exposing (..)
import Css.Global exposing (Snippet, children, everything, typeSelector)


paddingInlineStart : Length compatible units -> Style
paddingInlineStart arg1 =
    property "padding-inline-start" arg1.value


marginInlineStart : Length compatible units -> Style
marginInlineStart arg1 =
    property "margin-inline-start" arg1.value


textOutline : Length compatible units -> Color -> Style
textOutline blurRadius color =
    property "text-shadow"
        ([ "1px 1px " ++ blurRadius.value ++ " " ++ color.value
         , "-1px 1px " ++ blurRadius.value ++ " " ++ color.value
         , "1px -1px " ++ blurRadius.value ++ " " ++ color.value
         , "-1px -1px " ++ blurRadius.value ++ " " ++ color.value
         ]
            |> String.join ","
        )


dropShadow : Style
dropShadow =
    property "filter" "drop-shadow(2px 2px 14px #E8F8FD)"


snippets : List Snippet
snippets =
    [ typeSelector "html"
        [ backgroundColor baseColor0
        , color darkTextColor
        , fontFamilies [ qt "M PLUS Rounded 1c" ]
        , fontWeight bold
        ]
    , typeSelector "h2"
        [ textAlign center
        , color lightTextColor
        , textOutline (px 2) lightTextShadowColor
        , whiteSpace noWrap
        , padding2 (rem 1.0) (px 0)
        , fontSize (rem 2.0)
        ]
    , typeSelector "h3"
        [ backgroundColor accentColor1
        , color lightTextColor
        , borderRadius (rem 1.0)
        , textOutline (px 1) lightTextShadowColor
        , padding2 (rem 1.0) (rem 1.0)
        , dropShadow
        , fontWeight bold
        ]
    , everything
        [ color mainTextColor
        ]
    , typeSelector "article"
        [ nthOfType "n+2"
            [ marginTop (rem 2.0)
            ]
        ]
    , typeSelector "article"
        [ backgroundColor mainColor0
        , color darkTextColor
        , border3 (px 8) solid accentColor1
        , borderRadius (rem 1.0)
        , padding4 (px 0) (rem 2.0) (rem 2.0) (rem 2.0)
        , dropShadow
        ]
    , typeSelector "p"
        [ margin2 (em 1.0) (px 0) ]
    , typeSelector "ol"
        [ paddingInlineStart (em 1.0) ]
    , typeSelector "ul"
        [ paddingInlineStart (em 1.0) ]
    , typeSelector "pre"
        [ children
            [ typeSelector "code"
                [ display block
                , overflow scroll
                , width (pct 100)
                , backgroundColor codeBackgroundColor
                , color codeTextColor
                ]
            ]
        ]
    , typeSelector "dt"
        [ before
            [ property "content" "'面接官'"
            , lineHeight (rem 5.0)
            , marginLeft (rem -7.0)
            , marginRight (rem 2.0)
            , backgroundColor (hex "C5CCD3")
            , width (rem 5)
            , height (rem 5)
            , display inlineBlock
            , textAlign center
            , verticalAlign middle
            , borderRadius (pct 100)
            , border3 (px 1) solid lightTextShadowColor
            ]
        ]
    , typeSelector "dt"
        [ position relative
        , maxWidth (pct 100)
        , minHeight (rem 8.0)
        , padding (px 10)
        , backgroundColor (hex "EAEAEA")
        , marginInlineStart (rem 7)
        , borderRadius (px 10)
        , verticalAlign middle
        , marginTop (rem 1.0)
        , fontSize (rem 1.0)
        , whiteSpace preWrap
        , dropShadow
        , border3 (px 1) solid lightTextShadowColor
        ]
    , typeSelector "dt"
        [ after
            [ property "content" "''"
            , position absolute
            , borderStyle solid
            , borderWidth4 (px 24) (px 24) (px 24) (px 0)
            , borderColor2 transparent (hex "EAEAEA")
            , display block
            , width (px 0)
            , zIndex (int 1)
            , left (px -24)
            , top (px 24)
            , borderTop3 (px 1) solid lightTextShadowColor
            ]
        ]

    -- dd
    , typeSelector "dd"
        -- icon
        [ before
            [ float right -- add
            , property "content" "'私'"
            , lineHeight (rem 5.0)
            , marginLeft (rem -8.0)
            , marginRight (rem -8.0)
            , backgroundColor (hex "C5CCD3")
            , width (rem 5)
            , height (rem 5)
            , display inlineBlock
            , textAlign center
            , verticalAlign middle
            , borderRadius (pct 100)
            , border3 (px 1) solid lightTextShadowColor
            ]
        ]
    , typeSelector "dd"
        -- comment body
        [ position relative
        , maxWidth (calc (pct 100) minus (rem 8))
        , width (pct 100)
        , minHeight (rem 6.0)
        , padding (px 10)
        , backgroundColor (hex "EAEAEA")
        , borderRadius (px 10)
        , verticalAlign middle
        , marginTop (rem 1.0)
        , fontSize (rem 1.0)
        , whiteSpace preWrap
        , dropShadow
        , border3 (px 1) solid lightTextShadowColor
        ]
    , typeSelector "dd"
        -- comment head
        [ after
            [ property "content" "''"
            , position absolute
            , borderStyle solid
            , borderWidth4 (px 24) (px 0) (px 24) (px 24) -- diff
            , borderColor2 transparent (hex "EAEAEA")
            , display block
            , width (px 0)
            , zIndex (int 1)
            , right (px -24) -- diff
            , top (px 24)
            , borderTop3 (px 1) solid lightTextColor
            ]
        ]
    ]
