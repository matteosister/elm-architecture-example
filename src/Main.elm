module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)
import Init
import Model exposing (Msg(..))
import Update exposing (update)
import View exposing (view)


main =
    Browser.application
        { init = Init.init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        , onUrlRequest = UrlRequested
        , onUrlChange = UrlChanged
        }
