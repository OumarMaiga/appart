class DashboardsController < ApplicationController

  before_action :authenticate_user!
  before_action :set_admin_changed, only: [:change_state_admin, :edit_admin, :update_admin, :delete_admin]
  before_action :set_location_changed, only: [:change_state_location, :edit_location, :update_location, :show_location, :delete_location]
  before_action :set_type_changed, only: [:change_state_type, :edit_type, :update_type, :delete_type]
  before_action :set_carateristique_changed, only: [:edit_caracteristique, :update_caracteristique, :show_caracteristique, :delete_caracteristique]
  before_action :set_reservation, only: [:confirmer, :show_reservation]
  before_action :set_user_changed, only: [:change_state_user, :delete_user]


  def index
  end

  def locations
    @location = Location.new
    @locations = Location.all
  end

  def create_location

    location_params = params.require(:location).permit(:titre, :adresse, :description, :etat, :prix, :duree, :type_id, :nombre_adulte, :nombre_enfant, :nombre_salon, :nombre_chamber, :nombre_toillete, :nom_bailleur, :email_bailleur, :telephone_bailleur, :adresse_bailleur, :user_id, images_attributes: [:id, :location, :libelle], caracteristique_ids: [])

    params[:location][:adresse].inspect
      @location = current_user.locations.new(location_params) if user_signed_in?

    respond_to do |format|
      if @location.save
        # Enregistrement des images de l'appartement

        if is_image?
          params[:images]['libelle'].each do |a|
            @image = @location.images.create!(:libelle => a)
          end
        end

        format.html { redirect_to show_location_path(@location.slug), notice: 'Location créée avec succès.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end

  end

  # PATCH  /dashboards/locations
  def change_state_location
    @location = Location.new
    @locations = Location.all

    if @location_changed.etat == true
      @location_changed.update(etat: false)
      redirect_to dashboards_locations_path
    else
      @location_changed.update(etat: true)
      redirect_to dashboards_locations_path
    end
  end
  
  # GET /dashboards/locations/1/edit
  def edit_location
    @location = @location_changed
    @locations = Location.all
    render 'locations'
  end

  # PATCH /dashboards/locations/1
  def update_location
    @location = Location.new
    @locations = Location.all
    
    if @location_changed.update(location_params)
      redirect_to dashboards_locations_path
    else
      @location = @location_changed
      render 'locations', notice: "Mise à jour non effectuée"
    end
  end

  def show_location
    @location = @location_changed

    @reservation = Reservation.new
    
    @images = Image.where(location_id: @location)
    @image_last = @images.last

    # Autocomplete
    @adresses = Location.distinct.pluck(:adresse)
  end

  # DELETE /dashboards/locations/1
  def delete_location
    if @location_changed.destroy
      redirect_to dashboards_locations_path, notice: "Administrateur a été supprimer"
    end
  end

  def is_image?
    params[:images] != nil
  end
  
  def types
    @types = Type.all
    @type = Type.new
  end

  def create_type
    type_params = params.require(:type).permit(:libelle, :etat, :image, :user_id)
    @type = current_user.types.new(type_params)
    
    if @type.save
      redirect_to dashboards_types_path, notice: "Type a été ajouté"
    else
      render 'types'
    end

  end

  def show_type
    @type = Type.find_by(slug: params[:slug])
  end

  def edit_type
    @type = @type_changed
    @types = Type.all
    render 'types'
  end

  def update_type
    @type = Type.new
    @types = Type.all
    
    if @type_changed.update(type_params)
      redirect_to dashboards_types_path
    else
      @type = @type_changed
      render 'types', notice: "Mise à jour non effectuée"
    end
  end

  def delete_type
    @type = Type.find_by_slug(params[:slug])
    if @type.destroy
      redirect_to dashboards_types_path, notice: "Type a été supprimer"
    end
  end

  def caracteristiques
    @caracteristiques = Caracteristique.all
    @caracteristique = Caracteristique.new
  end

  def create_caracteristique
    caracteristique_params = params.require(:caracteristique).permit(:libelle, :icon)
    @caracteristique = Caracteristique.new(caracteristique_params)
    
    if @caracteristique.save
      redirect_to dashboards_caracteristiques_path, notice: 'Caracteristique a bien été créée.'
    else
      render 'caracteristiques'
    end

  end

  def show_caracteristique
    @caracteristique = @caracteristique_changed
  end

  def edit_caracteristique
    @caracteristique = @caracteristique_changed
    @caracteristiques = Caracteristique.all
    render 'caracteristiques'
  end

  def update_caracteristique
    @caracteristique = Caracteristique.new
    @caracteristiques = Caracteristique.all
    
    if @caracteristique_changed.update(caracteristique_params)
      redirect_to dashboards_caracteristiques_path
    else
      @caracteristique = @caracteristique_changed
      render 'caracteristiques', notice: "Mise à jour non effectuée"
    end
  end

  def delete_caracteristique
    @caracteristique = Caracteristique.find_by_libelle(params[:libelle])
    if @caracteristique.destroy
      redirect_to dashboards_caracteristiques_path, notice: "Caracteristique a été supprimer"
    end
  end

  # GET  /dashboards/administrateurs
  def administrateurs
    @admin = User.new
    @admins = User.where(categorie: 'Administrateur')
  end

  def create_admin
    @admin = User.new(admin_params)
    
    if @admin.save
      redirect_to dashboards_administrateurs_path, notice: "#{@admin.categorie} a été ajouté"
    else
      render 'administrateurs'
    end

  end

  # PATCH  /dashboards/administrateurs
  def change_state_admin
    @admin = User.new
    @admins = User.where(categorie: 'Administrateur')

    if @admin_changed.etat == true
      @admin_changed.update(etat: false)
      redirect_to dashboards_administrateurs_path
    else
      @admin_changed.update(etat: true)
      redirect_to dashboards_administrateurs_path
    end
  end
  
  # GET /dashboards/administrateurs/1/edit
  def edit_admin
    @admin = @admin_changed
    @admins = User.where(categorie: 'Administrateur')
    render 'administrateurs'
  end

  # PATCH /dashboards/administrateurs/1
  def update_admin
    @admin = User.new
    @admins = User.where(categorie: 'Administrateur')
    admin_params = params.require(:user).permit(:nom, :prenom, :email, :telephone, :adresse, :categorie, :image, :etat)

    if @admin_changed.update(admin_params)
      redirect_to dashboards_administrateurs_path
    else
      @admin = @admin_changed
      render 'administrateurs', notice: "Mise à jour non effectuée"
    end
  end

  # DELETE /dashboards/administrateurs/1
  def delete_admin
    if @admin_changed.destroy
      redirect_to dashboards_administrateurs_path, notice: "Administrateur a été supprimer"
    end
  end


  # GET /dashboards/administrateurs/1
  def profil

  end
  def utilisateurs
    @users = User.where(categorie: 'Utilisateur')
  end

  # PATCH  /dashboards/utilisateur
  def change_state_user
    @user = User.new
    @users = User.where(categorie: 'Utilisateur')

    if @user_changed.etat == true
      @user_changed.update(etat: false)
      redirect_to dashboards_utilisateurs_path
    else
      @user_changed.update(etat: true)
      redirect_to dashboards_utilisateurs_path
    end
  end

  # DELETE /dashboards/utilisateurs/1
  def delete_user
    if @user_changed.destroy
      redirect_to dashboards_utilisateurs_path, notice: "Utilisateur a été supprimer"
    end
  end


  def reservations
    @reservations = Reservation.all
  end

  def show_reservation
    @images = Image.where(location_id: @reservation.location)
    @image = @images.last
  end

  def confirmer
    @reservation.update(confirmer: :true)
    ReservationMailer.reservation_confirmer(@reservation).deliver_now
    respond_to do |format|
      format.html { redirect_to show_reservation_path(@reservation.slug), notice: "Un mail confirmation a été envoyé à #{@reservation.email}" }
    end
  end


  def admin_params
    params.require(:user).permit(:nom, :prenom, :email, :password, :telephone, :adresse, :categorie, :image, :etat)
  end

  def location_params    
    params.require(:location).permit(:titre, :adresse, :description, :etat, :prix, :duree, :type_id, :nombre_adulte, :nombre_enfant, :nombre_salon, :nombre_chamber, :nombre_toillete, :nom_bailleur, :email_bailleur, :telephone_bailleur, :adresse_bailleur, :user_id, images_attributes: [:id, :location, :libelle], caracteristique_ids: [])
  end

  def type_params
    params.require(:type).permit(:libelle, :etat, :image, :user_id)
  end

  def caracteristique_params
    params.require(:caracteristique).permit(:libelle, :icon)
  end
  
  def set_admin_changed
    @admin_changed = User.find_by_email(params[:email])
  end

  def set_location_changed
    @location_changed = Location.find_by_slug(params[:slug])
  end

  def set_user_changed
    @user_changed = User.find_by_email(params[:email])
  end

  def set_type_changed
    @type_changed = Type.find_by_slug(params[:slug])
  end

  def set_carateristique_changed
    @caracteristique_changed = Caracteristique.find_by_libelle(params[:libelle])
  end

  def set_reservation
    @reservation = Reservation.find_by_slug(params[:slug])
  end


end
