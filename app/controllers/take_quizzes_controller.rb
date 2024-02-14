# app/controllers/take_quizzes_controller.rb

class TakeQuizzesController < ApplicationController
  before_action :authenticate_student!
  before_action :set_take_quiz, only: [:show, :start, :answer]

  # GET /take_quizzes/new
  def new
    @take_quiz = TakeQuiz.new
    # No need to find a quiz here since it's done in the create action from form submission
  end

  # POST /take_quizzes
  def create
    @take_quiz = TakeQuiz.new(takequiz_params)
    @take_quiz.student_id = current_student.id
    
    if @take_quiz.save
      redirect_to start_take_quiz_path(@take_quiz) # Redirect to a custom start path or directly to show
    else
      render :new
    end
  end

  # Add other actions like 'show', 'start', 'answer' as necessary

  private

  def set_take_quiz
    @take_quiz = TakeQuiz.find(params[:id])
  end

  def takequiz_params
    params.require(:take_quiz).permit(:student_id, :quiz_id)
  end
end


=begin class TakeQuizzesController < ApplicationController
  before_action :authenticate_student!
  before_action :set_take_quiz, only: [:show, :start, :answer]

  # GET /take_quizzes/1

  
  
  
  
  def new
    @take_quiz = TakeQuiz.new
    @quiz = Quiz.find(params[:quiz_id])
  end

  def create
    @take_quiz = TakeQuiz.new(takequiz_params)
    @take_quiz.student_id = current_student.id  
    @take_quiz.quiz_id = @quiz.id
    @take_quiz.save
      
  end










  private

  def takequiz_params
    params.require(:take_quiz).permit(:student_id, :quiz_id)
  end 
  
end 
=end
