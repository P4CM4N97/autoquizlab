# app/controllers/take_quizzes_controller.rb
class TakeQuizzesController < ApplicationController
  before_action :authenticate_student!
  before_action :set_take_quiz, only: [:show, :start, :answer]

  # GET /take_quizzes/new
  def new
    @take_quiz = TakeQuiz.new
    @quizzes = Quiz.all # Assuming you want to list all quizzes
  end

  # POST /take_quizzes
  def create
    @take_quiz = TakeQuiz.new(takequiz_params)
    @take_quiz.student_id = current_student.id

    if @take_quiz.save
      redirect_to take_quiz_path(@take_quiz) # Redirect to the quiz taking page
    else
      render :new
    end
  end

  # GET /take_quizzes/:id
  def show
    # If the quiz has not started, show the first question or instructions
    unless @take_quiz.started?
      @take_quiz.start!
      @current_question = @take_quiz.current_question
    end

    # Load the current question and display it
    @current_question = @take_quiz.current_question
  end

  # Add actions for 'start', 'answer' as necessary...
  # ...

  private

  def set_take_quiz
    @take_quiz = TakeQuiz.find(params[:id])
  end

  def takequiz_params
    params.require(:take_quiz).permit(:quiz_id)
  end
end
