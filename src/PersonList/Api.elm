module PersonList.Api exposing (caricaPersone)

import Http
import Json.Decode as D
import PersonList.Model exposing (Msg(..), Persona)


caricaPersone : Http.Expect Msg
caricaPersone =
    Http.expectJson PersoneCaricate decoderPersonList


decoderPersonList : D.Decoder (List Persona)
decoderPersonList =
    D.field "results"
        (D.list
            (D.map2 Persona
                (D.field "url" D.string)
                (D.field "name" D.string)
            )
        )
