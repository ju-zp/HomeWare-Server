class BoardsController < ApplicationController

    def edit
        @board = Board.find(params[:board])
        @board.name = params[:name]
        if @board.save
            render json: {success: 'Successfully updated board name', name: params[:name]}, status: 200
        else
            render json: {error: 'Unable to update board info'}, status: 401
        end
        # puts 'hello'
    end

end