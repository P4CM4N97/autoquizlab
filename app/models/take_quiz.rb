# app/models/take_quiz.rb
class TakeQuiz < ApplicationRecord
  belongs_to :quiz
  belongs_to :student
  has_many :responses, dependent: :destroy

  # Marks the quiz as started and sets the first question
  def start!
    update!(started_at: Time.current, current_question_index: 0)
  end

  # Advances to the next question
  def next_question!
    update!(current_question_index: current_question_index + 1)
  end

  # Checks if the quiz has been started
  def started?
    started_at.present?
  end

  # Retrieves the current question based on the index
  def current_question
    quiz.questions.order(:id)[current_question_index] if started?
  end

  # Checks if the quiz has been completed
  def completed?
    completed_at.present? || current_question_index >= quiz.questions.count
  end

  # Registers a student's response to a question
  def record_response!(selected_answer)
    responses.create!(question: current_question, answer: selected_answer)
  end

  # Marks the quiz as completed
  def complete!
    update!(completed_at: Time.current)
  end

  # Calculates the score based on correct answers (optional)
  def calculate_score
    correct_answers = responses.joins(:answer).where('answers.correct': true).count
    # This assumes that your Answer model has a boolean `correct` field that indicates the correct answer
    self.score = correct_answers # Add a score attribute to TakeQuiz model if you want to store the score
    save!
  end
end
