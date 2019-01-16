class EnvironmentController < ApplicationController

    def getEnvironment
        @user = User.find_by(username: params[:username])
        @home = Home.find(@user.home_id)
        if @home 
            render json: {home: @home.name, boards: @home.boards.map(|b| b.name)}
        else
            render json: {error: 'No environment found'}, status: 401
        byebug
        puts 'hello'
    end

end