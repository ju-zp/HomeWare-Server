class TemperaturesController < ApplicationController

    def reading
        @session = User.find_by(username: params[:username]).sessions.last
        if @session
            @tempReading = TemperatureReading.create(session: @session, reading: params[:reading], time: DateTime.current())
            render json: {success: 'successfully recorded temperature'}, status: 201
        else
            render json: {error: 'Unable to record temperature'}, status: 501
        end
        
    end

end