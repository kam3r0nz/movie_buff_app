class MoviesController < ApplicationController
    get '/movies' do
        @movies = Movie.all
        erb :'movies/index'
    end

    get '/movies/new' do
        erb :'movies/new'
    end

    post '/movies' do
        @movie = Movie.create(title: params[:title], genre: params[:genre], release_year: params[:release_year], director: params[:director], description: params[:description])
        redirect "/movies/#{@movie.id}"
    end

    get '/movies/:id' do
        @movie = Movie.find(params[:id])
        erb :'movies/show'
    end

    get '/movies/:id/edit' do
        @movie = Movie.find(params[:id])
        erb :'movies/edit'
    end

    patch '/movies/:id' do
        @movie = Movie.find(params[:id])
        @movie.update(title: params[:title], genre: params[:genre], release_year: params[:release_year], director: params[:director], description: params[:description])
        redirect "/movies/#{@movie.id}"
    end

    delete '/movies/:id/delete' do
        @movie = Movie.find(params[:id])
        @movie.delete
        redirect "/movies"
    end
end