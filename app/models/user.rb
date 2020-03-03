class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :post_likes
    has_many :likes, dependent: :destroy
    has_secure_password
end