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
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            redirect "/users/#{user.id}"
        else
            redirect '/login'
        end
    end

    post '/signup' do
        user = User.create(username: params[:username], password: params[:password])
        session[:user_id] = user.id
        redirect "/users/#{user.id}"
    end

    get '/users/:id' do
        @user = User.find(params[:id])
        @movies = Movie.all
        if logged_in?
            erb :'users/show'
        else
            redirect '/login'
        end
    end

    get '/logout' do
        if logged_in?
            session.clear
            redirect '/login'
        else
            redirect '/'
        end
    end

end