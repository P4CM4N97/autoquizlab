class TakeQuiz < ApplicationRecord
  belongs_to :quiz
  belongs_to :student
end
