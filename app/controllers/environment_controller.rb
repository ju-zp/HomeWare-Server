class EnvironmentController < ApplicationController

    def getEnvironment
        @user = User.find_by(username: params[:username])
        # @home = Home.find(@user.home_id)
        byebug
        puts 'hello'
    end

end