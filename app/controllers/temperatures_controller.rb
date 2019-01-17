class TemperaturesController < ApplicationController

    def reading
        @board = User.find_by(username: params[:username]).home.boards.first
        if @board
            @temperature = Temperature.first
            @tempReading = TemperatureReading.create(temperature: @temperature, reading: params[:reading], temperature_id: @temperature.id )
            render json: {success: 'successfully recorded temperature'}, status: 201
        else
            render json: {error: 'Unable to record temperature'}, status: 501
        end
    end

    def getTemperatures
        @data = TemperatureReading.all
        @data = @data[@data.length-30..@data.length]
        time = 15
        @format = @data.map do |d|
            time -= 0.5
            {time: time, temp: d.reading}
        end
        if @format
            render json: {data: @format}, status: 201
        else
            render json: {error: 'Unable to get temperature'}, status: 501
        end
    end

end