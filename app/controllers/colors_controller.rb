class ColorsController < ApplicationController

    def saveColor
        @user = User.find_by(username: params[:username])
        @color = Color.new(color_params)
        byebug
        puts "hello"
    end

    private 

    def color_params
        params.require(:color).permit(:red, :green, :blue, :name)
    end

end