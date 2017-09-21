module ClockInTest exposing (..)

import Expect exposing (Expectation)
import ClockIn exposing (..)
import Test exposing (..)
import Test.Html.Query as Query
import Test.Html.Selector exposing (text, tag)


model : Model
model =
    Model False False


suite : Test
suite =
    describe "ClockIn"
        [ describe "Model"
            [ test "should mark server as ok if request was sent" <|
                \_ ->
                    model
                        |> update ServerOk
                        |> Tuple.first
                        |> Expect.equal { gpsOk = False, serverOk = True }
            , test "should mark server as fail if request failed" <|
                \_ ->
                    model
                        |> update ServerFail
                        |> Tuple.first
                        |> Expect.equal { gpsOk = False, serverOk = False }
            ]
        , describe "View"
            [ test "should contain ClockIn button on the page" <|
                \_ ->
                    view model
                        |> Query.fromHtml
                        |> Query.find [ tag "button" ]
                        |> Query.has [ text "ClockIn" ]
            ]
        ]
