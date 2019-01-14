class TemperaturesController < ApplicationController

    def reading
        @session = User.find_by(username: params[:username]).sessions.last
        if @session
            @tempReading = TemperatureReading.create(session: @session, reading: params[:reading], time: DateTime.current())
            puts @tempReading
        end
        
    end

end