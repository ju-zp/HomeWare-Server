class UsersController < ApplicationController 

    def signup
        @home = Home.first
        @user = User.new(username: params[:username], password: params[:password], home: @home)
        if @user.save
            render json: {username: @user.username, id: @user.id}
        else
            render json: {error: 'Invalid'}, status: 401
        end
    end

    def login 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            render json: {username: @user.username, id: @user.id}
        else 
            render json: {error: 'Invalid username/password combination'}, status: 401
        end
    end

    def validate
        @user = User.find_by(username: params[:username])
        if @user
            render json: {username: @user.username, id: @user.id}
        else
            render json: {error: 'Invalid username.'}, status: 401
        end
    end
    
end