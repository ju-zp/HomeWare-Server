class HomeController < ApplicationController

    def edit
        @user = User.find_by(username: params[:username])
        @home = @user.home
        @home.name = params[:home]
        if @home.save
            render json: {success: 'Successfully updated home name', name: params[:home]}, status: 200
        else
            render json: {error: 'Unable to update home name'}, status: 401
        end
    end

end