class StudentsController < ApplicationController
  # before_action :authenticate_student!
  before_action :set_institution, only: [:edit, :update, :destroy]
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  def index
    @students = Student.all

  end

  def show
    @institution = Institution.find(current_student.institution_id)
    @teachers = @institution.teachers
  end

  def new
    @institution = Institution.find(params[:institution_id])
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    @student.institution_id = params[:institution_id]
    if @student.save
      redirect_to @student.institution, notice: 'El estudiante se ha creado de manera exitosa.'
    else
      render :new
    end
  end

  def edit
    @student = current_student
  end

  def update
    @student = current_student
    if @student.update(student_params)
      redirect_to @student, notice: 'Estudiante ha sido actualizado de manera exitosa.'
    else
      render :edit
    end
  end

  def destroy
    @student.destroy
    redirect_to @institution, status: :see_other, notice: 'Estudiante ha sido eliminado de manera exitosa.'
  end

  def list
    @materia = current_student.subjects.find_by(teacher_id: 23)
    @quizzes = @materia.teacher.quizzes
  end

  private

  def student_params
    params.require(:student).permit(:name, :email, :password)
  end

  def set_student
    @student = Student.find(params[:id])
  end

  def set_institution
    @institution = Institution.find(params[:institution_id])
  end

end
