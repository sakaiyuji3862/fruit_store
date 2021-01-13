class OrdersController < ApplicationController
    def index
        @tweet = Tweet.find(params[:tweet_id])
    end
end
