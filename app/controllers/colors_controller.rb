class ColorsController < ApplicationController

    def saveColor
        @color = Color.new(color_params)
        byebug
        puts "hello"
    end

    private 

    def color_params
        params.require(:color).permit(:red, :green, :blue)
    end

end