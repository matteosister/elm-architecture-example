module Update exposing (update)

import Browser
import Browser.Navigation as Nav
import Model exposing (Model, Msg(..))
import PersonList.Update
import Routing
import UpdateReturn
import Url


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlRequested urlRequest ->
            case urlRequest of
                Browser.Internal url ->
                    let
                        route =
                            Routing.toRoute url
                    in
                    ( model, Nav.pushUrl model.key (Url.toString url) )

                Browser.External href ->
                    ( model, Nav.load href )

        UrlChanged url ->
            ( { model | route = Routing.toRoute url }, Cmd.none )

        PersonListMsg subMsg ->
            let
                ( subModel, subCmd, updateReturn ) =
                    PersonList.Update.update subMsg model.personListModel

                updateReturnCommand =
                    UpdateReturn.getCommand model.flags.swapiUrl PersonListMsg updateReturn
            in
            ( { model | personListModel = subModel }, Cmd.batch [ updateReturnCommand, Cmd.map PersonListMsg subCmd ] )
