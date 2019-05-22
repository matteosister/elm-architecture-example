module PersonList.View exposing (view)

import Html exposing (..)
import Html.Attributes exposing (class, disabled)
import Html.Events exposing (onClick)
import PersonList.Model exposing (Model, Msg(..), Persona)


view : Model -> ( String, Html Msg )
view model =
    let
        content =
            if model.loading then
                div [ class "spinner-border" ] [ span [ class "sr-only" ] [ text "Loading..." ] ]

            else
                ul [ class "list-group" ] (List.map viewPerson model.persone)
    in
    ( "Lista Persone"
    , div []
        [ hr [] []
        , button [ onClick Reload, disabled model.loading, class "btn btn-primary" ] [ text "reload" ]
        , hr [] []
        , content
        ]
    )


viewPerson : Persona -> Html Msg
viewPerson persona =
    li [ class "list-group-item" ] [ text persona.name ]
