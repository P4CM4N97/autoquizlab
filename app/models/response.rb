class Response < ApplicationRecord
  belongs_to :take_quiz
  belongs_to :question
  belongs_to :answer
end
