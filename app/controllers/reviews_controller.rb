class ReviewsController < ApplicationController
    get '/reviews' do
        if logged_in?
            @reviews = current_user.reviews
            erb :'/reviews/index'
        else
            redirect "/login"
        end
    end

    post '/reviews' do
        @review = current_user.reviews.create(params)
        flash[:success] = "Review successfully added."
        redirect "/movies/#{@review.movie.id}"
    end

    get '/reviews/:id/edit' do
        @review = Review.find(params[:id])
        if logged_in? && @review.user == current_user
            if Review.exists?(params[:id])
                erb :'/reviews/edit'
            else
                redirect back
            end
        else
            redirect '/login'
        end
    end

    patch '/reviews/:id' do
        @review = Review.find(params[:id])
        @review.update(date: params[:date], rating: params[:rating], comment: params[:comment])
        flash[:success] = "Your changes have been saved."
        redirect "/movies/#{@review.movie.id}"
    end

    delete '/reviews/:id/delete' do
        @review = Review.find(params[:id])
        @review.delete
        flash[:success] = "Review successfully deleted."
        redirect back
    end
end