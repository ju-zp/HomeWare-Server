class TemperaturesController < ApplicationController

    def reading
        @user = User.find_by(username: params[:username])
        puts @user
        puts params
    end

end