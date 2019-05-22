module PersonList.Init exposing (init)

import PersonList.Api exposing (caricaPersone)
import PersonList.Model exposing (Model, Msg(..))
import UpdateReturn exposing (UpdateReturn, simpleGetRequest)


init : ( Model, Cmd Msg, UpdateReturn Msg )
init =
    ( PersonList.Model.initialModel
    , Cmd.none
    , simpleGetRequest caricaPersone
    )
