module GlobalCss exposing (dropShadow, snippets)

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
    property "filter"
        ("drop-shadow(1px 1px 1px "
            ++ yellowColor.value
            ++ ")"
        )


dropShadowRainbow : Style
dropShadowRainbow =
    property "filter"
        ("drop-shadow(1px 1px 1px "
            ++ yellowColor.value
            ++ ")"
            ++ " "
            ++ "drop-shadow(4px 4px 4px "
            ++ redColor.value
            ++ ")"
        )


snippets : List Snippet
snippets =
    [ typeSelector "html"
        [ backgroundImage (url "\"data:image/svg+xml,%3Csvg xmlns='http://www.w3.org/2000/svg' width='24' height='24' viewBox='0 0 24 24'%3E%3Cg fill='%23cff0fc' fill-opacity='0.2'%3E%3Cpolygon fill-rule='evenodd' points='8 4 12 6 8 8 6 12 4 8 0 6 4 4 6 0 8 4'/%3E%3C/g%3E%3C/svg%3E\"")
        , backgroundColor baseColor0
        , backgroundRepeat repeat
        , color darkTextColor
        , fontFamilies [ qt "M PLUS Rounded 1c" ]
        , fontWeight bold
        ]
    , typeSelector "h2"
        [ textAlign center
        , color lightTextColor
        , whiteSpace noWrap
        , padding2 (rem 1.0) (px 0)
        , fontSize (rem 1.6)
        ]
    , typeSelector "h3"
        [ before
            [ property "content" "'◽'"
            ]
        ]
    , typeSelector "h3"
        [ backgroundColor accentColor1
        , color lightTextColor
        , borderRadius (rem 1.0)
        , textOutline (px 1) lightTextShadowColor
        , padding2 (rem 1.0) (rem 1.0)
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
        [ backgroundImage (url "\"data:image/svg+xml,%3Csvg width='48' height='64' viewBox='0 0 48 64' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M48 28v-4L36 12 24 24 12 12 0 24v4l4 4-4 4v4l12 12 12-12 12 12 12-12v-4l-4-4 4-4zM8 32l-6-6 10-10 10 10-6 6 6 6-10 10L2 38l6-6zm12 0l4-4 4 4-4 4-4-4zm12 0l-6-6 10-10 10 10-6 6 6 6-10 10-10-10 6-6zM0 16L10 6 4 0h4l4 4 4-4h4l-6 6 10 10L34 6l-6-6h4l4 4 4-4h4l-6 6 10 10v4L36 8 24 20 12 8 0 20v-4zm0 32l10 10-6 6h4l4-4 4 4h4l-6-6 10-10 10 10-6 6h4l4-4 4 4h4l-6-6 10-10v-4L36 56 24 44 12 56 0 44v4z' fill='%23AAAAAA' fill-opacity='0.4' fill-rule='evenodd'/%3E%3C/svg%3E\"")
        , backgroundColor mainColor0
        , backgroundRepeat repeat
        , color darkTextColor
        , border3 (px 8) solid accentColor1
        , borderRadius (rem 1.0)
        , padding4 (px 0) (rem 2.0) (rem 2.0) (rem 2.0)
        , dropShadowRainbow
        ]
    , typeSelector "p"
        [ margin2 (em 1.0) (px 0) ]
    , typeSelector "ol"
        [ paddingInlineStart (em 2.0) ]
    , typeSelector "ul"
        [ paddingInlineStart (em 2.0) ]
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
    , typeSelector "dl"
        [ paddingBottom (rem 2.0)
        ]
    , typeSelector "dt"
        [ before
            [ property "content" "'脳内上司'"
            , float left
            , lineHeight (rem 5.0)
            , marginLeft (rem -8.0)
            , marginRight (rem 3.0)
            , color darkTextColor2
            , backgroundColor (hex "C5CCD3")
            , width (rem 5)
            , height (rem 5)
            , display block
            , textAlign center
            , verticalAlign middle
            , borderRadius (pct 100)
            , border3 (px 1) solid mainColor2
            ]
        ]
    , typeSelector "dt"
        [ position relative
        , maxWidth (pct 100)
        , minHeight (rem 8.0)
        , padding (px 10)
        , backgroundColor (hex "EAEAEA")
        , color darkTextColor2
        , marginInlineStart (rem 8)
        , borderRadius (px 10)
        , verticalAlign middle
        , marginTop (rem 2.0)
        , fontSize (rem 1.0)
        , whiteSpace preWrap
        , dropShadow
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
            , top (px 40)
            , borderTop3 (px 1) solid mainColor2
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
            , color darkTextColor2
            , width (rem 5)
            , height (rem 5)
            , display inlineBlock
            , textAlign center
            , verticalAlign middle
            , borderRadius (pct 100)
            , border3 (px 1) solid mainColor2
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
        , color darkTextColor2
        , borderRadius (px 10)
        , verticalAlign middle
        , marginTop (rem 2.0)
        , fontSize (rem 1.0)
        , whiteSpace preWrap
        , dropShadow
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
            , top (px 40)
            , borderTop3 (px 1) solid mainColor1
            ]
        ]
    ]
