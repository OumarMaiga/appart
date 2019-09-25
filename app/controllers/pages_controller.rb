class PagesController < ApplicationController
  def index
  end

  def _nav
  end

  def users
  end

=begin
  def search
    add = Location.arel_table
    @locations = Location.where(add[:adresse].matches("%#{ params[:q]}"))
    
  end
=end

end
