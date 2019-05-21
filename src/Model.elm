module Model exposing (Flags, Model, Msg(..), initialModel)

import Browser
import Browser.Navigation as Nav
import PersonList.Model
import Routing
import Url


type Msg
    = UrlRequested Browser.UrlRequest
    | UrlChanged Url.Url
    | PersonListMsg PersonList.Model.Msg


type alias Flags =
    { swapiUrl : String }


type alias Model =
    { flags : Flags, route : Routing.Route, key : Nav.Key, personListModel : PersonList.Model.Model }


initialModel : Flags -> Routing.Route -> Nav.Key -> Model
initialModel flags route key =
    Model flags route key PersonList.Model.initialModel
