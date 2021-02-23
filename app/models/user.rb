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

   def self.guest
      find_or_create_by!(email: 'test@test.com') do |user|
         user.password = SecureRandom.alphanumeric(10) + [*'a'..'z'].sample(1).join + [*'0'..'9'].sample(1).join
         user.nickname = 'ゲストユーザー'
      end
   end
end
