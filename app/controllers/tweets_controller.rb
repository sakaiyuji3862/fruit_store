class TweetsController < ApplicationController
    before_action :set_find, except: [:index, :new, :create]
    def index
        @tweets = Tweet.includes(:user).order("created_at DESC")
    end

    def new
        @tweet = Tweet.new
    end

    def create
        # binding.pry
        @tweet = Tweet.new(tweet_params)
        if @tweet.save
            redirect_to root_path
        else
            render :new
        end
    end

    def show
        @comment = Comment.new
        @comments = @tweet.comments.includes(:user)
    end

    def edit
    end

    def update
        if @tweet.update(tweet_params)
            redirect_to tweet_path
        else
            render :edit
        end
    end

    def destroy
        @tweet.destroy
        redirect_to root_path
    end

    private

    def tweet_params
        params.require(:tweet).permit(:name, :price, :text, :shipping_cost_id,
                                      :shipping_day_id, :prefecture_id, :image).merge(user_id: current_user.id)
    end

    def set_find
        @tweet = Tweet.find(params[:id])
    end
end
