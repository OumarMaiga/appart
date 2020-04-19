class NotificationsController < ApplicationController


    def index
        @notifications = Notification.non_vue.all
    end

    def show
        @notification = Notification.find(params[:id])
    end



end