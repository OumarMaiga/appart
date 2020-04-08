class LocationsController < ApplicationController
  before_action :set_location, only: [:show, :edit, :update, :destroy]

  # GET /locations
  # GET /locations.json
  def index
    @locations = Location.includes(:images, :type).all.page params[:page]
  end

  # GET /locations/1
  # GET /locations/1.json
  def show
    @reservation = Reservation.new
    @images = Image.where(location_id: @location)
    @image_last = @images.last

    # Autocomplete
    @adresses = Location.distinct.pluck(:adresse)
  end

  # GET /locations/new
  def new
    @location = Location.new
  end

  # GET /locations/1/edit
  def edit
  end

  # POST /locations
  # POST /locations.json
  def create
    puts"-------------"
    puts params[:location][:adresse].inspect
      @location = current_user.locations.new(location_params) if user_signed_in?

    respond_to do |format|
      if @location.save
        # Enregistrement des images de l'appartement

        if is_image?
          params[:images]['libelle'].each do |a|
            @image = @location.images.create!(:libelle => a)
          end
        end

        format.html { redirect_to @location, notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def is_image?
    params[:images] != nil
  end

  # PATCH/PUT /locations/1
  # PATCH/PUT /locations/1.json
  def update
    respond_to do |format|
      if @location.update(location_params)
        
        # Enregistrement des images de l'appartement
        if is_image?
          params[:images]['libelle'].each do |a|
            @image = @location.images.create!(:libelle => a)
          end
        end
        format.html { redirect_to @location, notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locations/1
  # DELETE /locations/1.json
  def destroy
    @location.destroy
    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  #GET /location/1/type
  def type
    @type_id = params[:id]
    @type = Type.find(@type_id)
    @locations = Location.where(type_id: @type_id).includes(:images, :type).limit(6)
    @adresses = Location.distinct.where(type_id: @type_id).limit(6).pluck(:adresse)
    @three_adresses = Location.distinct.where(type_id: @type_id).limit(3).pluck(:adresse)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_location
      @location = Location.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def location_params
      params.require(:location).permit(:titre, :adresse, :description, :etat, :prix, :duree, :type_id, :nombre_adulte, :nombre_enfant, :nombre_salon, :nombre_chamber, :nombre_toillete, :nom_bailleur, :email_bailleur, :telephone_bailleur, :adresse_bailleur, :user_id, images_attributes: [:id, :location, :libelle], caracteristique_ids: [])
    end
end
