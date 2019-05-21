module PersonList.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (disabled)
import Html.Events exposing (onClick)
import PersonList.Model exposing (Model, Msg(..), Persona)


view : Model -> ( String, Html Msg )
view model =
    let
        content =
            if model.loading then
                div [] [ text "loading..." ]

            else
                div [] (List.map viewPerson model.persone)
    in
    ( "Lista Persone"
    , div []
        [ h2 [] [ text "lista persone" ]
        , button [ onClick Reload, disabled model.loading ] [ text "reload" ]
        , content
        ]
    )


viewPerson : Persona -> Html Msg
viewPerson persona =
    div [] [ text persona.name ]
