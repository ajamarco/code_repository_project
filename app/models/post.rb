class Post < ApplicationRecord
    has_many :tag_posts
    has_many :tags, through: :tag_posts

    belongs_to :language
end
