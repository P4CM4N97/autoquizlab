class QuizzesController < ApplicationController
  before_action :set_quiz, only: [:show, :edit, :update, :destroy]

  def index
    @quizzes = Quiz.all
  end

  def new
    @quiz = Quiz.new
  end

  def create
    @quiz = Quiz.new(quiz_params)
    @quiz.teacher = current_teacher
    if @quiz.save
      redirect_to @quiz, notice: 'El examen ha sido creado de manera exitosa.'
    else
      render :new
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
    @generated_content = @quiz.content
    
  end

  def edit
  end

  def update
    if @quiz.update(quiz_params)
      redirect_to @quiz, notice: 'El examen ha sido actualizado de manera exitosa.'
    else
      render :edit
    end
  end

  def destroy
    @quiz.destroy
    redirect_to quizzes_url, notice: 'El examen ha sido eliminado de manera exitosa.'
  end

  private
    def set_quiz
      @quiz = Quiz.find(params[:id])
    end

    def quiz_params
      params.require(:quiz).permit(:title, :description, :subject_name, :topic, :number_of_questions, :exam_level)
    end
end
