class PagesController < ApplicationController
  def dates_indisponible

    Reservation.unscoped.pluck(:debut, :fin).map do |range|
      puts "-----------------------------"
      puts range.inspect
    end

  end
  
  def index
    @adresses = Location.pluck(:adresse).sort
    @locations = Location.includes(:images, :type).all
  end

  def _nav
  end

  def search
    #.where.not(debut: dates_indisponible)
    add = Location.arel_table
    @locations = Location.where(add[:adresse].matches("%#{ params[:query]}")).includes(:images, :type).all
    
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
    @adresses = Location.select(:adresse).where(add[:adresse].matches("%#{params[:query]}%")).all
    puts @adresses.inspect

    if request.xhr?
      render :partial => 'query', locals: {:adresses => @adresses}
    end
  end

end
