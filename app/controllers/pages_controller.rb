class PagesController < ApplicationController
  
  def dates_indisponible

    Reservation.unscoped.pluck(:debut, :fin).map do |range|
      puts "-----------------------------"
      puts range.inspect
    end

  end
  
  def index
    puts @adresses = Location.distinct.pluck(:adresse)
    @locations = Location.includes(:images, :type).all.limit(6)
    @types = Type.where(etat: 1)
  end

  def _nav
  end

  def search
    # Recuperation de tous les locations d'une adresse
    add = Location.arel_table
    @locations = Location.where(add[:adresse].matches("%#{ params[:query]}")).includes(:images, :type).all
    # Suppression des locations déjà reserver 
    @locations.each do |location|
      @reservations = Reservation.where(location_id: location.id).all
      dates_range = @reservations.map { |date| date.debut.strftime("%d-%m-%Y")..date.fin.strftime("%d-%m-%Y") }
      puts"===================="
      puts dates_range.inspect
      puts"===================="
      dates_range.each do |range|
        puts "range"
        puts range.inspect
        puts "value"
        puts params[:debut]
        puts params[:fin]
        puts range.include?(params[:debut])
        if range.include?(params[:debut]) || range.include?(params[:fin])
          puts "inclus"
          puts location.inspect
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
    puts @adresses.inspect

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
    @locations = Location.where(type_id: params[:type]).where(adresse: params[:adresse]).page params[:page]
    if @locations
      respond_to do |format|
        format.html { render :template =>'locations/index' }
      end
    end
  end

end
