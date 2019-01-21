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

    def create
        @user = User.new(user_params)
        @currentUser = User.find_by(username: params[:username])
        @user.home = @currentUser.home
        if @user.save
            render json: {success: 'User was successfully created'}, status: 200
        else
            render json: {error: 'Unable to create new user'}, status: 401
        end
    end

    def destroy
        @user = User.find_by(username: params[:username])
        if @user.destroy
            render json: {success: 'User was successfully destoryed'}, status: 200
        else
            render json: {error: 'Unable to delete user'}, status: 401
        end
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :home_id)
    end
    
end