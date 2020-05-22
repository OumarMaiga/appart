class PagesController < ApplicationController
  
  def dates_indisponible

    Reservation.unscoped.pluck(:debut, :fin).map do |range|

    end

  end
  
  def index
    @adresses = Location.distinct.pluck(:adresse)
    @locations = Location.includes(:images, :type).all.limit(4)
    @types = Type.where(etat: 1)
  end

  def _nav
  end

  def search
    # Recuperation de tous les locations d'une adresse
    add = Location.arel_table
    @locations = Location.where(add[:adresse].matches("%#{ params[:query]}")).includes(:images, :type).all.page params[:page]
    # Suppression des locations déjà reserver 
    @locations.each do |location|
      @reservations = Reservation.where(location_id: location.id).all
      dates_range = @reservations.map { |date| date.debut.strftime("%d-%m-%Y")..date.fin.strftime("%d-%m-%Y") }
      
      dates_range.each do |range|
        if range.include?(params[:debut]) || range.include?(params[:fin])
          location.inspect
        end
      end
    end
    
    if @locations
      respond_to do |format|
        format.html { render :template => 'locations/index' }
      end
    end

  end


  def users
    @users = User.all
  end

  def user
    @user = User.find(params[:id])
  end

  def query
    add = Location.arel_table
    @adresses = Location.pluck(:adresse).where(add[:adresse].matches("%#{params[:query]}%")).all

    if request.xhr?
      render :partial => 'query', locals: {:adresses => @adresses}
    end
  end

  def adresse
    @locations = Location.where(adresse: params[:adresse]).page params[:page]
    if @locations
      respond_to do |format|
        format.html { render :template => 'locations/index' }
      end
    end
  end

  def type_adresse
    @type_id = Type.where(slug: params[:type])
    @locations = Location.where(type_id: @type_id).where(adresse: params[:adresse]).includes(:images, :type).page params[:page]
    if @locations
      respond_to do |format|
        format.html { render :template =>'locations/index' }
      end
    end
  end

end
