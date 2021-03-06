class OrderAddress
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :city, :address, :building_name, :phone_number, :user_id, :tweet_id, :token

    with_options presence: true do
        validates :post_code, format: {with: /\A\d{3}[-]\d{4}\z/} # 郵便番号（ハイフンあり7桁）
        validates :city
        validates :address
        validates :phone_number, format: {with: /\A\d{10,11}\z/} # 携帯番号(ハイフンなし10桁or11桁)
        validates :prefecture_id, numericality: {other_than: 1}
        validates :user_id
        validates :tweet_id
        validates :token
    end

    def save
        order = Order.create(user_id: user_id, tweet_id: tweet_id)
        Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address,
                       building_name: building_name, phone_number: phone_number, order_id: order.id)
    end

end