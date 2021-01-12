class Tweet < ApplicationRecord
    has_one_attached :image
    belongs_to :user
    has_many :comments, dependent: :destroy

    extend ActiveHash::Associations::ActiveRecordExtensions
    belongs_to :prefecture
    belongs_to :shipping_cost
    belongs_to :shipping_day


    with_options presence: true do
        validates :name
        validates :price, format: {with: /\A[0-9]+\z/}, #半角数字
                  numericality: {
                    greater_than_or_equal_to: 300,
                    less_than_or_equal_to: 9999999
                  }
        validates :text
        validates :shipping_cost_id, numericality: { other_than: 1 }
        validates :shipping_day_id, numericality: { other_than: 1 }
        validates :prefecture_id, numericality: { other_than: 1 }
        validates :image
    end


end
