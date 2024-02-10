# app/controllers/take_quizzes_controller.rb
class TakeQuizzesController < ApplicationController
  before_action :authenticate_student!
  before_action :set_take_quiz, only: [:show, :start, :answer]

  # GET /take_quizzes/1
  def show
    # Si el quiz está completado, mostramos las preguntas y respuestas
    if @take_quiz.completed?
      @questions = @take_quiz.quiz.questions.includes(:answer)
      @responses = @take_quiz.quiestion
    end
    # No es necesario hacer nada adicional aquí para empezar el examen, solo mostramos el botón en la vista.
  end

  # POST /take_quizzes/1/start
  def start
    @take_quiz.start! # Aquí realmente iniciamos el quiz
    redirect_to take_quiz_path(@take_quiz) # Redirigimos al usuario a la vista del quiz para empezar a responder preguntas.
  end

  # POST /take_quizzes/1/answer
  def answer
    # Aquí capturamos la respuesta seleccionada por el estudiante y la registramos
    selected_answer = Answer.find(params[:answer_id])
    @take_quiz.record_response!(selected_answer)

    # Verificamos si todas las preguntas han sido respondidas para completar el quiz
    if @take_quiz.all_questions_answered?
      @take_quiz.complete!
      redirect_to take_quiz_path(@take_quiz) # Redirigimos al usuario a la página de resultados
    else
      @take_quiz.next_question! # Pasamos a la siguiente pregunta
      redirect_to take_quiz_path(@take_quiz) # Redirigimos para mostrar la siguiente pregunta
    end
  end

  private

  def set_take_quiz
    @take_quiz = TakeQuiz.find(params[:id])
    redirect_to root_path, alert: 'No tienes permiso para visualizar este quiz.' unless @take_quiz.student == current_student
  end
end
