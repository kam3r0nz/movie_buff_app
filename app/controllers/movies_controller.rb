class MoviesController < ApplicationController
    get '/movies' do
        @movies = current_user.movies
        if logged_in?
            erb :'movies/index'
        else
            redirect "/login"
        end
    end

    get '/movies/new' do
        if logged_in?
            erb :'movies/new'
        else
            redirect "/login"
        end
    end

    post '/movies' do
        @movie = Movie.create(title: params[:title], genre: params[:genre], release_year: params[:release_year], director: params[:director], description: params[:description], user: current_user)
        redirect "/movies/#{@movie.id}"
    end

    get '/movies/:id' do
        @movie = Movie.find(params[:id])
        if logged_in?
            erb :'movies/show'
        else
            redirect "/login"
        end
    end

    get '/movies/:id/edit' do
        @movie = Movie.find(params[:id])
        if logged_in?
            erb :'movies/edit'
        else
            redirect "/login"
        end
    end

    patch '/movies/:id' do
        @movie = Movie.find(params[:id])
        @movie.update(title: params[:title], genre: params[:genre], release_year: params[:release_year], director: params[:director], description: params[:description])
        redirect "/movies/#{@movie.id}"
    end

    delete '/movies/:id/delete' do
        @movie = Movie.find(params[:id])
        @movie.delete
        redirect "/movies/#{@movie.id}"
    end
end