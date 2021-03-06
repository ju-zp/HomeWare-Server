class ColorsController < ApplicationController

    def saveColor
        @user = User.find_by(username: params[:username])
        @color = Color.new(color_params)
        @color.user = @user
        if @color.save
            render json: {response: 'Successfully save color', colors: @user.colors}, status: 201
        else
            render json: {error: 'Unable to save color'}, status: 501
        end
    end

    def getColors
        @user = User.find_by(username: params[:username])
        render json: {colors: @user.colors}, status: 201
       
    end

    private 

    def color_params
        params.require(:color).permit(:red, :green, :blue, :name)
    end

end