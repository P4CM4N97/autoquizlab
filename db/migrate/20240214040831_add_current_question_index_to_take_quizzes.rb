class AddCurrentQuestionIndexToTakeQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :take_quizzes, :current_question_index, :integer
  end
end
