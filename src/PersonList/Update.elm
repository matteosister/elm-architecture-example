module PersonList.Update exposing (update)

import AppMessage exposing (AppMessage(..))
import Http
import PersonList.Api exposing (caricaPersone)
import PersonList.Model exposing (Model, Msg(..))
import UpdateReturn as UR exposing (UpdateReturn, emptyUpdateReturn, simpleGetRequest)


update : Msg -> Model -> ( Model, Cmd Msg, UpdateReturn Msg )
update msg model =
    case msg of
        PersoneCaricate personeResult ->
            case personeResult of
                Err error ->
                    ( { model | loading = False }
                    , Cmd.none
                    , emptyUpdateReturn
                        |> UR.withMessage (Warning "problema chiamata http")
                    )

                Ok persone ->
                    ( { model | persone = persone, loading = False }, Cmd.none, emptyUpdateReturn )

        Reload ->
            ( { model | persone = [], loading = True }, Cmd.none, simpleGetRequest caricaPersone |> UR.withoutAppMessage )
