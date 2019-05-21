module Routing exposing (Route(..), routeParser, toRoute)

import Url
import Url.Parser exposing ((</>), Parser, int, map, oneOf, s, string, top)


type Route
    = Homepage
    | PersonList
    | NotFound


toRoute : Url.Url -> Route
toRoute =
    Maybe.withDefault NotFound << Url.Parser.parse routeParser


routeParser : Parser (Route -> a) a
routeParser =
    oneOf
        [ map Homepage top
        , map PersonList (s "lista-persone")
        ]
