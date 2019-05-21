module Init exposing (init)

import Browser.Navigation as Nav
import Model exposing (Flags, Model, Msg(..))
import PersonList.Init
import Routing exposing (Route(..))
import UpdateReturn
import Url


init : Flags -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    let
        route =
            Routing.toRoute url

        initialModel =
            Model.initialModel flags route key

        ( model, cmd ) =
            case route of
                PersonList ->
                    let
                        ( subModel, subCmd, updateReturn ) =
                            PersonList.Init.init

                        updateReturnCommand =
                            UpdateReturn.getCommand flags.swapiUrl PersonListMsg updateReturn
                    in
                    ( { initialModel | personListModel = subModel }, Cmd.batch [ updateReturnCommand, Cmd.map PersonListMsg subCmd ] )

                _ ->
                    ( initialModel, Cmd.none )
    in
    ( model, cmd )
