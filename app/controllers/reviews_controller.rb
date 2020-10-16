class ReviewsController < ApplicationController
    get '/reviews' do
        @reviews = Review.all
        erb :'/reviews/index'
    end

    get '/reviews/new' do
        erb :'/reviews/new'
    end

    post '/reviews' do
        @post = Post.new(params)
    end

    
end