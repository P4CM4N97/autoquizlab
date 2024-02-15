class AddCompletedAtToTakeQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :take_quizzes, :completed_at, :datetime
  end
end
