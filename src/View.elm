module View exposing (view)

import Browser
import Html exposing (..)
import Html.Attributes exposing (href)
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
        [ viewMenu
        , content
        ]


viewMenu : Html Msg
viewMenu =
    nav []
        [ a [ href "/" ] [ text "homepage" ]
        , a [ href "/lista-persone" ] [ text "lista persone" ]
        ]


viewHomepage : Html Msg
viewHomepage =
    text "Homepage"
