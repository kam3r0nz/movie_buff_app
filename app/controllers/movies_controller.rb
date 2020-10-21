class MoviesController < ApplicationController
    get '/movies' do
        if logged_in?
            @movies = current_user.movies
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
        if logged_in?
            @movie = Movie.find(params[:id])
            # @reviews = Review.select {|r| r.movie = @movie}
            erb :'movies/show'
        else
            redirect "/login"
        end
    end

    get '/movies/:id/edit' do
        if logged_in?
            @movie = Movie.find(params[:id])
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
        redirect "/movies"
    end
end