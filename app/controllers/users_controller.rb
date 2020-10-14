class UsersController < ApplicationController
    get '/signup' do
        erb :'users/signup'
    end

    post '/signup' do
        user = User.create(params)
        session[:user_id] = user.id
        redirect "/users/#{user.id}"
    end

end