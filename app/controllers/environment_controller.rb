class EnvironmentController < ApplicationController

    def getEnvironment
        @user = User.find_by(username: params[:username])
        @home = Home.find(@user.home_id)
        if @home 
            # render json: {home: @home.name, boards: @home.boards.map{|b| {name: b.name, lights: b.lights, temp: b.temperatures}}}
            render json: @home, include: {boards: { include: [:lights, :temperatures]}, users: {}}
        else
            render json: {error: 'No environment found'}, status: 401
        end
    end

    def getWeather
        require 'open-uri'
        resp = open('https://api.darksky.net/forecast/ff8f969b32a86f1e9f024852877c01e0/51.525503,-0.0822229?units=auto').read
        if resp 
            render json: {weather: JSON.parse(resp)}, status: 200
        else
            render json: {error: 'Unable to get weather'}, status: 401
        end
    end

end