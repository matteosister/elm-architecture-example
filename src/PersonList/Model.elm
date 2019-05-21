module PersonList.Model exposing (Model, Msg(..), Persona, initialModel)

import Http


type Msg
    = PersoneCaricate (Result Http.Error (List Persona))
    | Reload


type alias Model =
    { persone : List Persona
    , loading : Bool
    }


type alias Persona =
    { url : String
    , name : String
    }


initialModel : Model
initialModel =
    Model [] True
