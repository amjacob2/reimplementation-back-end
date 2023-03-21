class Api::V1::QuizQuestionsController < ApplicationController
    # GET /api/v1/quiz_questions
    def index
      assignments = "testing"

      questionnaire = Questionnaire.new
      #questionnaire.id = 1
      questionnaire.name = 'Questions'
      questionnaire.max_question_score = 10
      questionnaire.save!

      quiz_question = TrueFalse.new
      #quiz_question.id = 99
      quiz_question.type = 'TrueFalse'
      quiz_question.txt = 'Is this a true/false question?'
      quiz_question.weight = 5
      quiz_question.questionnaire_id = questionnaire.id
      quiz_question.seq = 1
      quiz_question.save!

      quiz_question_choice1 = QuizQuestionChoice.new
      quiz_question_choice1.txt = 'True'
      quiz_question_choice1.question_id = quiz_question.id
      quiz_question_choice1.iscorrect = true
      quiz_question_choice1.save!

      quiz_question_choice2 = QuizQuestionChoice.new
      quiz_question_choice2.txt = 'False'
      quiz_question_choice2.question_id = quiz_question.id
      quiz_question_choice2.iscorrect = false
      quiz_question_choice2.save!

      render json: quiz_question.edit()
    end

    def show
      quiz_question = QuizQuestion.all
      render json: quiz_question
    end
end