class ApplicationController < ActionController::Base

    helper_method :Admin?, :notification_non_vue
    
    def Admin?
        return true if user_signed_in? && current_user.categorie == "admin"
    end

    def notification_non_vue
        Notification.where(vue: false).count
    end

end