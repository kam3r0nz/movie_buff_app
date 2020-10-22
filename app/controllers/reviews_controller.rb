class ReviewsController < ApplicationController
    get '/reviews' do
        @reviews = current_user.reviews
        if logged_in?
            erb :'/reviews/index'
        else
            redirect "/login"
        end
    end

    get '/reviews/new' do
        @movies = Movie.all
        if logged_in?
            erb :'/reviews/new'
        else
            redirect "/login"
        end
    end

    post '/reviews' do
        @review = Review.create(date: params[:date], rating: params[:rating], content: params[:content], user: current_user, movie_id: params[:movie])
        redirect "/reviews/#{@review.id}"
    end

    get '/reviews/:id' do
        @review = Review.find(params[:id])
        if logged_in?
            erb :'/reviews/show'
        else
            redirect '/login'
        end
    end

    get '/reviews/:id/edit' do
        @review = Review.find(params[:id])
        if logged_in?
            erb :'/reviews/edit'
        else
            redirect '/login'
        end
    end

    patch '/reviews/:id' do
        @review = Review.find(params[:id])
        @review.update(date: params[:date], rating: params[:rating], content: params[:content])
        redirect "/reviews/#{@review.id}"
    end

    delete '/reviews/:id/delete' do
        @review = Review.find(params[:id])
        @review.delete
        redirect "/"
    end
end