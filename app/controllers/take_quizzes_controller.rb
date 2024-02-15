# app/controllers/take_quizzes_controller.rb

class TakeQuizzesController < ApplicationController
  before_action :authenticate_student!
  before_action :set_take_quiz, only: [:show, :start, :answer]


  # GET /take_quizzes/new
  def new
    @take_quiz = TakeQuiz.new
    # No need to find a quiz here since it's done in the create action from form submission
  end

#   # POST /take_quizzes
#   def create
#     @take_quiz = TakeQuiz.new(takequiz_params)
#     @take_quiz.student_id = current_student.id
    
#     if @take_quiz.save
#       redirect_to start_take_quiz_path(@take_quiz) # Redirect to a custom start path or directly to show
#     else
#       render :new
#     end
#   end
# # GET /quizzes/:quiz_id/take_quizzes/new
#   def new
#     @quiz = Quiz.find(params[:quiz_id]) # Find the quiz based on the URL parameter
#     @take_quiz = TakeQuiz.new(quiz: @quiz)
#   end


#   # POST /take_quizzes
#   def create
#     @quiz = Quiz.find(params[:quiz_id])
#     @take_quiz = @quiz.take_quizzes.new(takequiz_params)
#     @take_quiz.student = current_student

#     if @take_quiz.save
#       redirect_to @take_quiz
#     else
#       render :new
#     end
#   end

#   # GET /take_quizzes/:id
#   def show
#     # If the quiz has not started, show the first question or instructions
#     unless @take_quiz.started?
#       @take_quiz.start!
#       @current_question = @take_quiz.current_question
#     end

#     # Load the current question and display it
#     @current_question = @take_quiz.current_question
#   end

#   # POST /take_quizzes/:id/start
#   def start
#     # Start the quiz and redirect to the first question
#     @take_quiz.start! unless @take_quiz.started?
#     redirect_to question_take_quiz_path(@take_quiz, @take_quiz.current_question)
#   end

#   # POST /take_quizzes/:id/answer
#   def answer
#     # Process the answer and move to next question or complete the quiz
#     selected_answer = Answer.find(params[:answer_id])
#     @take_quiz.record_answer!(selected_answer)

#     if @take_quiz.completed?
#       @take_quiz.complete!
#       redirect_to result_take_quiz_path(@take_quiz)
#     else
#       redirect_to question_take_quiz_path(@take_quiz, @take_quiz.next_question!)

#     end
#   end

#   # Add other actions like 'show', 'start', 'answer' as necessary

#   private

#   def set_take_quiz
#     @take_quiz = TakeQuiz.find(params[:id])
#   end

#   def takequiz_params
#     params.require(:take_quiz).permit(:student_id, :quiz_id)
#   end
end
