class LightsController < ApplicationController

    def setLight
        @light = Light.first
        @light.switched_on = params[:state]
        @light.save
    end

end