class ReviewsController < ApplicationController
    get '/reviews' do
        if logged_in?
            @reviews = current_user.reviews
            erb :'/reviews/index'
        else
            redirect "/login"
        end
    end

    get '/reviews/new' do
        if logged_in?
            @movies = current_user.movies
            erb :'/reviews/new'
        else
            redirect "/login"
        end
    end

    post '/reviews' do
        @review = Review.create(date: params[:date], rating: params[:rating], content: params[:content], user: current_user)
        redirect "/reviews/#{@review.id}"
    end

    get '/reviews/:id' do
        if logged_in?
            @review = Review.find(params[:id])
            erb :'/reviews/show'
        else
            redirect '/login'
        end
    end

    get '/reviews/:id/edit' do
        if logged_in?
            @review = Review.find(params[:id])
            erb :'/reviews/edit'
        else
            redirect '/login'
        end
    end

    patch '/reviews/:id' do
        @review = Review.find(params[:id])
        @review.update(name: params[:name], date: params[:date], rating: params[:rating], content: params[:content])
        redirect "/reviews/#{@review.id}"
    end

    delete '/reviews/:id/delete' do
        @review = Review.find(params[:id])
        @review.delete
        redirect "/reviews"
    end
end