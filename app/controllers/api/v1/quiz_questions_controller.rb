class Api::V1::QuizQuestionsController < ApplicationController
    # GET /api/v1/quiz_questions
    def index
      # using this method to create new model objs in the database
      # TODO: this is temporary

      # questionnaire = Questionnaire.new
      # #questionnaire.id = 1
      # questionnaire.name = 'Questions'
      # questionnaire.max_question_score = 10
      # questionnaire.save!

      quiz_question = MultipleChoiceCheckbox.new
      #quiz_question.id = 99
      quiz_question.type = 'MultipleChoiceCheckbox'
      quiz_question.txt = 'Which of the following are NC State mascots?'
      quiz_question.weight = 5
      quiz_question.questionnaire_id = 2
      quiz_question.seq = 1
      # quiz_question.save!

      # quiz_question_choice1 = QuizQuestionChoice.new
      # quiz_question_choice1.txt = 'Mr. Wuf'
      # quiz_question_choice1.question_id = quiz_question.id
      # quiz_question_choice1.iscorrect = true
      # quiz_question_choice1.save!

      # quiz_question_choice2 = QuizQuestionChoice.new
      # quiz_question_choice2.txt = 'Tuffy'
      # quiz_question_choice2.question_id = quiz_question.id
      # quiz_question_choice2.iscorrect = true
      # quiz_question_choice2.save!

      # quiz_question_choice3 = QuizQuestionChoice.new
      # quiz_question_choice3.txt = 'Mrs. Wuf'
      # quiz_question_choice3.question_id = quiz_question.id
      # quiz_question_choice3.iscorrect = true
      # quiz_question_choice3.save!

      # quiz_question_choice4 = QuizQuestionChoice.new
      # quiz_question_choice4.txt = 'Demon Deacon'
      # quiz_question_choice4.question_id = quiz_question.id
      # quiz_question_choice4.iscorrect = false
      # quiz_question_choice4.save!

      render json: quiz_question
    end

    def show
      type = params[:type]

      quiz_question = []

      if type == 'TrueFalse' then
        quiz_question = TrueFalse.all
      elsif type == 'MultipleChoiceRadio' then
        quiz_question = MultipleChoiceRadio.all
      elsif type == 'MultipleChoiceCheckbox' then
        quiz_question = MultipleChoiceCheckbox.all
      end
      
      render json: quiz_question.to_json(:include => :quiz_question_choices)
    end
end