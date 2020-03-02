class User < ApplicationRecord
    has_many :posts
    has_many :comments
    has_many :post_likes
    has_secure_password
end