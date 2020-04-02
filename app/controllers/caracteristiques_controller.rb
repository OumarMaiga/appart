class CaracteristiquesController < ApplicationController
  before_action :set_caracteristique, only: [:show, :edit, :update, :destroy]

  # GET /caracteristiques
  # GET /caracteristiques.json
  def index
    @caracteristiques = Caracteristique.all
  end

  # GET /caracteristiques/1
  # GET /caracteristiques/1.json
  def show
  end

  # GET /caracteristiques/new
  def new
    @caracteristique = Caracteristique.new
  end

  # GET /caracteristiques/1/edit
  def edit
  end

  # POST /caracteristiques
  # POST /caracteristiques.json
  def create
    @caracteristique = Caracteristique.new(caracteristique_params)

    respond_to do |format|
      if @caracteristique.save
        format.html { redirect_to @caracteristique, notice: 'Caracteristique was successfully created.' }
        format.json { render :show, status: :created, location: @caracteristique }
      else
        format.html { render :new }
        format.json { render json: @caracteristique.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /caracteristiques/1
  # PATCH/PUT /caracteristiques/1.json
  def update
    respond_to do |format|
      if @caracteristique.update(caracteristique_params)
        format.html { redirect_to @caracteristique, notice: 'Caracteristique was successfully updated.' }
        format.json { render :show, status: :ok, location: @caracteristique }
      else
        format.html { render :edit }
        format.json { render json: @caracteristique.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /caracteristiques/1
  # DELETE /caracteristiques/1.json
  def destroy
    @caracteristique.destroy
    respond_to do |format|
      format.html { redirect_to caracteristiques_url, notice: 'Caracteristique was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_caracteristique
      @caracteristique = Caracteristique.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def caracteristique_params
      params.require(:caracteristique).permit(:libelle, :icon)
    end
end
