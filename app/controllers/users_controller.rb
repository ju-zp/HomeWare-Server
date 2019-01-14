class UsersController < ApplicationController 

    def signup
        @user = User.new(username: params[:username], password: params[:password])
        if @user.save
            Session.create(user: @user, logged_in: DateTime.current())
            render json: {username: @user.username, id: @user.id}
        else
            render json: {error: 'Invalid'}, status: 401
        end
    end

    def login 
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            Session.create(user: @user, logged_in: DateTime.current())
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

    def logout
        @session = User.find_by(username: params[:username]).sessions.last
        @session.logged_out = DateTime.current()
        if @session.save
            render json: {responce: 'success'}
        else
            render json: {error: 'unable to log out'}, status: 401
        end
    end

end