class Post < ApplicationRecord
    has_many :tag_posts
    has_many :tags, through: :tag_posts
    has_many :post_likes
    has_many :comments
    belongs_to :user
<<<<<<< HEAD

=======
>>>>>>> initial_pages
    belongs_to :language
end
