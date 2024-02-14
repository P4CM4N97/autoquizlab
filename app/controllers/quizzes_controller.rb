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
    @generated_content = @quiz.content
    @generated_content = @generated_content.split("\n").reject {|element| element == ""}
    @generated_content.each_with_index do |element,index|
      if element.end_with?("?")
        question = Question.new
        question.question = element
        question.quiz_id = @quiz.id
        question.answers.push(@generated_content[index+1], @generated_content[index+2], @generated_content[index+3])        
        question.answer = @generated_content[index+4].match(/[a-c]\)/)[0].delete(")")
        
        
        
        question.save
      end
    end
      redirect_to @quiz
    end
  end

  def show
    @quiz = Quiz.find(params[:id])
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
      params.require(:quiz).permit(:title, :description, :subject_name, :topic, :number_of_questions, :exam_level, :student_age)
    end
end
