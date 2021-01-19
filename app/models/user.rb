class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         has_many :tweets
         has_many :comments
         has_many :orders

         with_options presence: true do
            validates :nickname
            validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze} #半角英数字
            validates :password, confirmation: true
         end
end
