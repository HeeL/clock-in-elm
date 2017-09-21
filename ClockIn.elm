module ClockIn exposing (..)

import Html exposing (Html, div, text, program, button)
import Html.Events exposing (onClick)


-- MODEL


type alias Model =
    { gpsOk : Bool, serverOk : Bool }


init : ( Model, Cmd Msg )
init =
    ( { gpsOk = False, serverOk = False }, Cmd.none )



-- MESSAGES


type Msg
    = GpsOk
    | GpsFail
    | ServerOk
    | ServerFail



-- VIEW


view : Model -> Html Msg
view model =
    div []
        [ div []
            [ text ("GPS: " ++ toString model.gpsOk ++ ", Server:" ++ toString model.serverOk) ]
        , button [ onClick GpsOk ] [ text "ClockIn" ]
        ]



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        GpsOk ->
            ( { model | gpsOk = True }, Cmd.none )

        GpsFail ->
            ( { model | gpsOk = False }, Cmd.none )

        ServerOk ->
            ( { model | serverOk = True }, Cmd.none )

        ServerFail ->
            ( { model | serverOk = False }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none



-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }
