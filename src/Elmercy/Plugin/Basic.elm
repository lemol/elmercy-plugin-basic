module Elmercy.Plugin.Basic exposing (detector)

import Elmercy.System exposing (FileList)



-- DETECTOR


detector : FileList -> Bool
detector =
    [ "Index.elm"
    , "Main.elm"
    ]
        |> List.any
        |> List.member



-- READER


type alias MainModule a =
    { a
        | expose : List TopExposing
        , imports : List Import
        , declarations : List Declaration
    }


default : MainModule a
default =
    { expose =
        [ funExpose "main" ]
    , imports =
        [ importStmt
            [ "Html" ]
            Nothing
            (Just <| exposeExplicit [ closedTypeExpose "Html" ])
        ]
    }
