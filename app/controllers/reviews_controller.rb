class ReviewsController < ApplicationController
    get '/reviews' do
        @reviews = Review.all
        erb :'/reviews/index'
    end

    get '/reviews/new' do
        erb :'/reviews/new'
    end

    post '/reviews' do
        @review = Review.create(name: params[:name], date: params[:date], rating: params[:rating], content: params[:content])
    end

    get '/reviews/:id' do
        @review = Review.find(params[:id])
        erb :'/reviews/show'
    end

    get '/reviews/:id/edit' do
        @review = Review.find(params[:id])
        erb :'/reviews/edit'
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