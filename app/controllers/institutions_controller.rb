class InstitutionsController < ApplicationController
  before_action :set_institution, only: [:show, :edit, :update, :destroy]

  # GET /institutions/new
  def new
    @institution = Institution.new
  end

  # POST /institutions
  def create
    @institution = Institution.new(institution_params)
    if @institution.save

      redirect_to @institution, notice: 'La institución se ha creado de manera exitosa.'
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  # PATCH/PUT /institutions/:id
  def update
    if @institution.update(institution_params)
      redirect_to @institution, notice: 'La institución ha sido actualizada de manera exitosa.'
    else
      render :edit
    end
  end

  # DELETE /institutions/:id
  def destroy
    @institution.destroy
    redirect_to institutions_url, notice: 'la institución ha sido eliminada de manera exitosa.'
  end

  private
    def set_institution
      @institution = Institution.find(params[:id])
    end

    def institution_params
    end
end
