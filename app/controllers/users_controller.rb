class UsersController < ApplicationController 

    def signup
        puts 'login'
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            render json: {username: @user.username, id: @user.id}
        else
            render json: {error: 'Invalid'}, status: 401
        end
    end

    def login 
        puts 'signup'
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            render json: {username: @user.username, id: @user.id}
        else 
            render json: {error: 'Invalid username/password combination'}, status: 401
        end
    end

    def validate
        puts 'validate'
        @user = USer.find_by(username: params[:username])
        if @user
            render json: {username: @user.username, id: @user.id}
        else
            render json: {error: 'Invalid username.'}, status: 401
        end
    end

end