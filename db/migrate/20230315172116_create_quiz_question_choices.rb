class CreateQuizQuestionChoices < ActiveRecord::Migration[7.0]
  def change
    create_table :quiz_question_choices do |t|
      t.integer :question_id
      t.text :txt
      t.boolean :iscorrect, default: false

      t.timestamps
    end
  end
end
