module View exposing (view)

import AppMessage
import Browser
import Html exposing (..)
import Html.Attributes exposing (class, classList, href)
import Html.Events exposing (onClick)
import Model exposing (Model, Msg(..))
import PersonList.View
import Routing exposing (Route(..))


view : Model -> Browser.Document Msg
view model =
    let
        ( title, content ) =
            case model.route of
                Homepage ->
                    ( "Homepage", viewHomepage )

                PersonList ->
                    PersonList.View.view model.personListModel
                        |> Tuple.mapSecond (Html.map PersonListMsg)

                NotFound ->
                    ( "not found", text "not found" )
    in
    Browser.Document
        title
        [ viewMenu model.route
        , div [ class "container" ] [ content ]
        , div [] (List.map AppMessage.render model.appMessages)
        ]


viewMenu : Route -> Html Msg
viewMenu route =
    ul [ class "nav justify-content-center nav-pills" ]
        [ li [ class "nav-item" ] [ a [ classList [ ( "nav-link", True ), ( "active", route == Homepage ) ], href "/" ] [ text "homepage" ] ]
        , li [ class "nav-item" ] [ a [ classList [ ( "nav-link", True ), ( "active", route == PersonList ) ], href "/lista-persone" ] [ text "lista persone" ] ]
        ]


viewHomepage : Html Msg
viewHomepage =
    text "Homepage"
