class UsersController < ApplicationController
    get '/signup' do
        erb :'users/signup'
    end

    get '/login' do
        user = User.find_by(session[:user_id])
        if logged_in?
            redirect "/users/#{user.id}"
        else
            erb :'users/login'
        end
    end

    post '/login' do
        user = User.find_by(username: params[:username])
        if params[:username] == "" || params[:password] == ""
            flash[:error] = "Please enter a username and password."
            redirect '/login'
        elsif user && !user.authenticate(params[:password])
            flash[:error] = "Incorrect password."
            redirect '/login'
        else
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect "/users/#{user.id}"
            else
                flash[:error] = "Account could not be found."
                redirect '/signup'
            end
        end
    end

    post '/signup' do
        if user = User.find_by(username: params[:username])
            flash[:error] = "Username is already taken."
            redirect '/signup'
        else
            @user = User.create(username: params[:username], password: params[:password])
            session[:user_id] = @user.id
            redirect "/users/#{@user.id}"
        end
    end

    get '/users/:id' do
        @movies = Movie.all
        if logged_in? && User.exists?(params[:id])
            @user = User.find(params[:id])
            erb :'users/show'
        else
            redirect '/login'
        end
    end

    delete '/users/:id/delete' do
        flash[:success] = "Account successfully deleted."
        @user = User.find_by(params[:id])
        @user.delete
        session.clear
        redirect '/'
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/'
        else
            redirect '/'
        end
    end
end