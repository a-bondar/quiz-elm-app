module View exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, src)
import Html.Events exposing (onClick)
import Model exposing (Model, Question)
import Update exposing (Msg)


getQuestion : List Question -> Maybe Question
getQuestion questions =
    List.head questions


getCorrectAnswer : List Model.Answer -> Maybe Model.Answer
getCorrectAnswer answers =
    List.head <|
        List.filter
            (\answer ->
                let
                    ( _, isCorrect ) =
                        answer
                in
                isCorrect
            )
            answers


renderAnswers : List Model.Answer -> List (Html Msg)
renderAnswers answers =
    List.map
        (\answer ->
            button [ onClick <| Update.Answer answer ]
                [ let
                    ( answerText, _ ) =
                        answer
                  in
                  text answerText
                ]
        )
        answers


renderBody : Model -> Html Msg
renderBody model =
    let
        question =
            getQuestion model.questions
    in
    case question of
        Just question ->
            div []
                [ img [ src question.img ] []
                , h2 [] [ text question.text ]
                , if model.isAnswered then
                    renderHint model.userAnswer question.answers
                  else
                    div [] <| renderAnswers question.answers
                ]

        Nothing ->
            h2 [] [ text <| "Done! Your score is " ++ toString model.correctCount ]


renderNextBtn : Bool -> Html Msg
renderNextBtn isAnswered =
    if isAnswered then
        button [ onClick Update.Next ] [ text "Next" ]
    else
        text ""


renderHint : Model.Answer -> List Model.Answer -> Html msg
renderHint ( answer, isCorrect ) answers =
    if isCorrect then
        p [ class "success" ] [ text "Correct!" ]
    else
        p [ class "invalid" ]
            [ let
                correctAnswer =
                    getCorrectAnswer answers
              in
              case correctAnswer of
                Just ( correctAnswerText, _ ) ->
                    span [] [ text <| "Invalid! Right answer is ", b [] [ text correctAnswerText ] ]

                Nothing ->
                    text ""
            ]


view : Model -> Html Msg
view model =
    div []
        [ h1 [] [ text "Quiz!" ]
        , renderBody model
        , renderNextBtn model.isAnswered
        ]
