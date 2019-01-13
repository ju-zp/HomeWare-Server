class UsersController < ApplicationController 

    def login
        puts 'login'
        @user = User.new(username:params[:username], password:params[:password])
        if @user.save
            render json: {username: @user.username, id: @user.id}
        else
            render json: {error: 'Invalid'}, status: 401
        end
    end

    def signup
        puts 'signup'
    end

    def validate
        puts 'validate'
    end

end