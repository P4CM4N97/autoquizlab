# app/models/take_quiz.rb
class TakeQuiz < ApplicationRecord
  belongs_to :quiz
  belongs_to :student


  # Marca el quiz como iniciado y establece la primera pregunta
  def start!
    update(started_at: Time.current, current_question_index: 0)
  end

  # Avanza a la siguiente pregunta
  def next_question!
    update(current_question_index: current_question_index + 1)
  end

  # Verifica si el quiz ha sido iniciado
  def started?
    started_at.present?
  end

  # Recupera la pregunta actual basada en el índice
  def current_question
    quiz.questions.order(:id)[current_question_index]
  end

  # Verifica si todas las preguntas han sido respondidas, indicando que el quiz está completo
  def completed?
    current_question_index >= quiz.questions.count
  end

  # # Registra la respuesta de un estudiante a una pregunta
  # def record_response!(selected_answer)
  #   responses.create!(question_id: current_question.id, answer_id: selected_answer.id)
  # end

  # Marca el quiz como completado
  def complete!
    update(completed_at: Time.current)
  end

  # Calcula la puntuación basada en respuestas correctas (opcional)
  # def calculate_score
  #   correct_answers = responses.joins(:answer).where('answers.correct': true).count
  #   # Esto asume que tu modelo Answer tiene un campo booleano `correct` que indica la respuesta correcta
  #   correct_answers
  # end
end
