class ReviewsController < ApplicationController
    get '/reviews' do
        redirect_if_not_logged_in
        @reviews = current_user.reviews
        erb :'/reviews/index'
    end

    post '/reviews' do
        @review = current_user.reviews.create(params)
        flash[:success] = "Review successfully added."
        redirect "/movies/#{@review.movie.id}"
    end

    get '/reviews/:id/edit' do
        redirect_if_not_logged_in
        set_review
        if Review.exists?(params[:id]) && @review.user == current_user
            erb :'/reviews/edit'
        else
            redirect back
        end
    end

    patch '/reviews/:id' do
        set_review
        params.delete(:_method)
        @review.update(date: params[:date], rating: params[:rating], comment: params[:comment])
        flash[:success] = "Your changes have been saved."
        redirect "/movies/#{@review.movie.id}"
    end

    delete '/reviews/:id/delete' do
        set_review
        @review.delete
        flash[:success] = "Review successfully deleted."
        redirect back
    end

    private
    
    def set_review
        @review = Review.find(params[:id])
    end
end