module Update exposing (..)

import Model exposing (Model)


type Msg
    = Next
    | Answer Model.Answer


getCorrectCount : Bool -> Int -> Int
getCorrectCount isCorrect count =
    if isCorrect then
        count + 1
    else
        count


update : Msg -> Model -> Model
update msg model =
    case msg of
        Next ->
            { model
                | isAnswered = False
                , questions = List.drop 1 model.questions
                , userAnswer = ( "", False )
            }

        Answer answer ->
            let
                ( _, isCorrect ) =
                    answer
            in
            { model
                | isAnswered = True
                , userAnswer = answer
                , correctCount = getCorrectCount isCorrect model.correctCount
            }
