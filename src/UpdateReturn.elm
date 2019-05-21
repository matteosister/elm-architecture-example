module UpdateReturn exposing (UpdateReturn, emptyUpdateReturn, getCommand, simpleGetRequest)

import Http
import Model exposing (Msg)


type alias UpdateReturn msg =
    { requests : List (Request msg)
    }


emptyUpdateReturn : UpdateReturn msg
emptyUpdateReturn =
    UpdateReturn []


simpleGetRequest : Http.Expect msg -> UpdateReturn msg
simpleGetRequest expect =
    UpdateReturn
        [ SimpleGetRequest { expect = expect }
        ]


type Request msg
    = SimpleGetRequest { expect : Http.Expect msg }


type alias Url =
    String


type alias RequestData msg =
    { method : String
    , headers : List Http.Header
    , url : String
    , body : Http.Body
    , expect : Http.Expect msg
    , timeout : Maybe Float
    , tracker : Maybe String
    }


convertToRequestData : Url -> Request msg -> RequestData msg
convertToRequestData url request =
    case request of
        SimpleGetRequest { expect } ->
            { method = "GET"
            , headers = []
            , url = url
            , body = Http.emptyBody
            , expect = expect
            , timeout = Nothing
            , tracker = Nothing
            }


getCommand : Url -> (msg -> Msg) -> UpdateReturn msg -> Cmd Msg
getCommand url mapper { requests } =
    let
        requestCommands =
            requests
                |> List.map (convertToRequestData url)
                |> List.map (Cmd.map mapper << Http.request)
    in
    Cmd.batch requestCommands
