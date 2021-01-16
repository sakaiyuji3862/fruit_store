class OrdersController < ApplicationController
    before_action :set_find, only: [:index, :create]
    def index
        @order_address = OrderAddress.new
    end

    def create
        @order_address = OrderAddress.new(order_address_params)
        if @order_address.valid?
            @order_address.save
            redirect_to root_path
        else
            render action: :index
        end
    end
end

private

def order_address_params
    params.require(:order_address).permit(:post_code, :prefecture_id, :city, :address, :building_name,
                                          :phone_number).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
end

def set_find
    @tweet = Tweet.find(params[:tweet_id])
end