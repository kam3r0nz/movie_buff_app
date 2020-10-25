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
        @review = Review.create(date: params[:date], rating: params[:rating], comment: params[:comment], user_id: current_user.id, movie_id: params[:movie])
        flash[:success] = "Review successfully added."
        redirect "/movies/#{@review.movie.id}"
    end

    get '/reviews/:id/edit' do
        if logged_in?
            if Review.exists?(params[:id])
                @review = Review.find(params[:id])
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
        redirect back
    end
end