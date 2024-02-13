class TeachersController < ApplicationController
  # before_action :authenticate_teacher!
  before_action :set_institution, only: [:new, :create]
  before_action :set_teacher, only: [:show, :edit, :update, :destroy]

  def index
    @teachers = Teacher.all # or scope to institution if necessary
  end

  def show
    @subjects = @teacher.subject
    @students = Student.where(institution_id: @teacher.institution_id)
  end

  def new
    @teacher = @institution.teachers.new
  end

  def create
    @teacher = @institution.teachers.new(teacher_params)
    if @teacher.save
      redirect_to @institution, notice: 'El profesor se ha creado de manera exitosa.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # def edit
  # end

  # def update
  #   if @teacher.update(teacher_params)
  #     redirect_to [@institution, @teacher], notice: 'El profesor ha sido actualizado de manera exitosa.'
  #   else
  #     render :edit
  #   end
  # end

  def destroy
    @teacher.destroy
    redirect_to @teacher.institution, notice: 'El profesor ha sido eliminado de manera exitosa.'
  end

  private

  def set_institution
    @institution = Institution.find(params[:institution_id])
  end

  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password, :password_confirmation, :institution_id)
  end
end
