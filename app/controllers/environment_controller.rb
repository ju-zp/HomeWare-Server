class EnvironmentController < ApplicationController

    def getEnvironment
        @user = User.find_by(username: params[:username])
        @home = Home.find(@user.home_id)
        if @home 
            render json: {home: @home.name, boards: @home.boards.map{|b| {name: b.name, lights: b.lights, temp: b.temperatures}}
        else
            render json: {error: 'No environment found'}, status: 401
        end
    end

end