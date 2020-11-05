class MoviesController < ApplicationController
    get '/movies' do
        redirect_if_not_logged_in
        @movies = current_user.movies
        erb :'movies/index'
    end

    get '/movies/new' do
        redirect_if_not_logged_in
        erb :'movies/new'
    end

    post '/movies' do
        if movie = Movie.find_by(title: params[:title])
            flash.now[:error] = "Movie has already been added."
            erb :'movies/new'
        else
            @movie = current_user.movies.create(params)
            flash[:success] = "Movie successfully added."
            redirect "/movies/#{@movie.id}"
        end
    end

    get '/movies/:id' do
        redirect_if_not_logged_in
        set_movie
        if Movie.exists?(params[:id])
            erb :'movies/show'
        else
            redirect back
        end
    end

    get '/movies/:id/edit' do
        redirect_if_not_logged_in
        set_movie
        if Movie.exists?(params[:id]) && @movie.user == current_user
            erb :'movies/edit'
        else
            redirect back
        end
    end

    patch '/movies/:id' do
        set_movie
        params.delete(:_method)
        @movie.update(params)
        flash[:success] = "Your changes have been saved."
        redirect "/movies/#{@movie.id}"
    end

    delete '/movies/:id/delete' do
        set_movie
        flash[:success] = "Movie successfully deleted."
        @movie.delete
        redirect '/movies'
    end

    private

    def set_movie
        @movie = Movie.find(params[:id])
    end
end