module AppMessage exposing (AppMessage(..), render)

import Html exposing (..)
import Html.Attributes exposing (class)


type AppMessage
    = Warning String


render : AppMessage -> Html msg
render message =
    case message of
        Warning content ->
            div [ class "app-message" ]
                [ div [ class "header" ] [ strong [] [ text "warning" ] ]
                , div [ class "body" ] [ text content ]
                ]
