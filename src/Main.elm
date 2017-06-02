module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)


-- APP


main : Program Never Int Msg
main =
    Html.beginnerProgram
        { model = model
        , view = view
        , update = update
        }



-- MODEL


type alias Model =
    Int


model : number
model =
    0



-- UPDATE


type Msg
    = NoOp
    | Increment


update : Msg -> Model -> Model
update msg model =
    case msg of
        NoOp ->
            model

        Increment ->
            model + 1



-- VIEW
-- Html is defined as: elem [ attribs ][ children ]
-- CSS can be applied via class names or inline style attrib

viewCode : String -> Html Msg
viewCode code =
  pre [] [
    Html.code [] [ text code ]
  ]

view : Model -> Html Msg
view model =
    Html.main_ []
        [ header []
            [ h1 [] [ text "MongoDB" ] ]
        , div [ class "row" ]
            [ h2 [] [ text "Commands" ]
            , viewCode "collectionName.find( query )"
            , viewCode "collectionName.findOne( query )"
            , viewCode "collectionName.find( query ).sort({ key: 1 | -1 })"
            , viewCode "collectionName.find( query ).limit( number )"
            , viewCode "collectionName.find( query ).count()"
            , viewCode "collectionName.insert( document )"
            , viewCode "collectionName.update( query, update, options )"
            , viewCode "collectionName.remove( query )"
            ]
        , div [ class "row" ]
            [ h2 [] [ text "Query" ]
            , viewCode "{ a: 10 }"
            , viewCode "{ a: 10, b: 'hello' }"
            , viewCode "{ a: { $gt: 10 } }"
            , viewCode "{ a: { $in: [10, 'hello'] } }"
            , viewCode "{ a: { $all: [10, 'hello'] } }"
            , viewCode "{ 'a.b': 10 }"
            , viewCode "{ a: { $elemMatch: { b: 1, c: 2 } } }"
            , viewCode "{ $or: [{ a: 1 }, { b: 2 }] }"
            , viewCode "{ a: /^m/ }"
            , viewCode "{ a: { $mod: [10, 1] } }"
            , viewCode "{ a: { $type: 2 } }"
            , viewCode "{ $text: { search: 'hello' } }"
            ]
        , div [ class "row" ]
            [ h2 [] [ text "Update" ]
            , viewCode "{ $inc: { a: 2 } }"
            , viewCode "{ $set: { a: 5 } }"
            , viewCode "{ $unset: { a: 1 } }"
            , viewCode "{ $push: { a: 1 } }"
            , viewCode "{ $push: { a: { $each: [1, 2] } } }"
            , viewCode "{ $push: { a: { $each: [5, 4], $sort: 1 } } }"
            , viewCode "{ $push: { a: { $each: [10, 2], $slice: 3 } } }"
            , viewCode "{ $push: { a: { $each: [3, 6], $position: 0 } } }"
            , viewCode "{ $addToSet: { a: 1 } }"
            , viewCode "{ $addToSet: { a: { $each: [1, 2] } } }"
            , viewCode "{ $pop: { a: 1 } }"
            , viewCode "{ $pop: { a: -1 } }"
            , viewCode "{ $pull: { a: 5 } }"
            , viewCode "{ $pullAll: { a: [5, 6] } }"
            , viewCode "{ $mul: { price: 1.25 } }"
            , viewCode "{ $min: { lowScore: 150 } }"
            , viewCode "{ $max: { highScore: 950 } }"
            , viewCode "{ $currentDate: { lastModified: true } }"
            ]
        , div [ class "row" ]
            [ h2 [] [ text "Index" ]
            , viewCode "collectionName.ensureIndex({ name: 1 })"
            , viewCode "collectionName.ensureIndex({ name: 1, age: -1 })"
            , viewCode "collectionName.ensureIndex({ name: 1 }, { unique: true })"
            , viewCode "collectionName.ensureIndex({ name: 1 }, { sparse: true })"
            , viewCode "collectionName.ensureIndex({ name: 1 }, { background: true })"
            , viewCode "collectionName.dropIndex({ name: 1 })"
            ]
        ]



-- CSS STYLES


styles : { img : List ( String, String ) }
styles =
    { img =
        [ ( "width", "33%" )
        , ( "border", "4px solid #337AB7" )
        ]
    }
