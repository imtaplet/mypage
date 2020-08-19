port module ChatPage exposing (Model, Msg, init, update, view)

import Css exposing (..)
import Html.Styled exposing (Attribute, Html, dd, dl, dt, h2, input, main_, text)
import Html.Styled.Attributes exposing (attribute, css, id, type_, value)
import Html.Styled.Events exposing (keyCode, on, onInput)
import Json.Decode as Json


port scrollConversation : () -> Cmd msg


type Msg
    = KeyDown Int
    | Input String


onKeyDown : (Int -> msg) -> Attribute msg
onKeyDown tagger =
    on "keydown" (Json.map tagger keyCode)


updateLastChat : String -> Model -> Model
updateLastChat newMessage model =
    { model
        | currentMessage = newMessage
        , chatList =
            model.chatList
                |> List.map
                    (\chat ->
                        if chat.avatar == Me && chat.isEditing then
                            { chat | message = newMessage }

                        else
                            chat
                    )
    }


closeLastChat : Model -> Model
closeLastChat model =
    { model
        | currentMessage = ""
        , chatList =
            model.chatList
                |> List.map
                    (\chat ->
                        if chat.avatar == Me && chat.isEditing then
                            { chat | isEditing = False }

                        else
                            chat
                    )
    }


closeEmptyChat : Model -> Model
closeEmptyChat model =
    { model
        | currentMessage = ""
        , chatList =
            model.chatList
                |> List.filter
                    (\chat ->
                        chat.avatar == Me && not chat.isEditing
                    )
    }


appendChat : String -> Model -> Model
appendChat message model =
    { model
        | currentMessage = message
        , chatList =
            model.chatList ++ [ { avatar = Me, message = message, isEditing = True } ]
    }


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        KeyDown k ->
            if k == 13 then
                ( model |> closeLastChat, Cmd.none )

            else
                ( model, Cmd.none )

        Input "" ->
            ( model |> closeEmptyChat, Cmd.none )

        Input message ->
            let
                newModel =
                    if model.chatList |> List.any (\chat -> chat.avatar == Me && chat.isEditing) then
                        updateLastChat message model

                    else
                        appendChat message model
            in
            ( newModel, scrollConversation () )


type Avatar
    = Me
    | Boss


type alias Chat =
    { avatar : Avatar
    , message : String
    , isEditing : Bool
    }


type alias Model =
    { chatList : List Chat
    , currentMessage : String
    }


init : Model
init =
    { chatList = []
    , currentMessage = ""
    }


view : Model -> Html Msg
view model =
    let
        editingStyle isEditing =
            if isEditing then
                css [ opacity (num 0.5) ]

            else
                css []

        chatElements =
            model.chatList
                |> List.map
                    (\{ avatar, message, isEditing } ->
                        if avatar == Me then
                            dd (editingStyle isEditing :: [ attribute "data-avator" "me" ]) [ text message ]

                        else
                            dt [ attribute "data-avator" "boss" ] [ text message ]
                    )
    in
    main_ []
        [ dl
            [ id "conversation"
            , css
                [ height (vh 60.0)
                , overflow scroll
                ]
            ]
            chatElements
        , input
            [ type_ "text"
            , onInput Input
            , onKeyDown KeyDown
            , value model.currentMessage
            , css
                [ width (pct 100)
                , backgroundColor (hex "FFF")
                ]
            ]
            []
        ]
