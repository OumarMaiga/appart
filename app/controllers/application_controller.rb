class ApplicationController < ActionController::Base

    def Admin?
        return true if current_user.categorie == "admin"
    end

end
