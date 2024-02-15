class AddStartedAtToTakeQuizzes < ActiveRecord::Migration[7.0]
  def change
    add_column :take_quizzes, :started_at, :datetime
  end
end
