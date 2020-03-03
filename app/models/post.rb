class Post < ApplicationRecord
    has_many :tag_posts
    has_many :tags, through: :tag_posts
    has_many :post_likes
    has_many :comments
    belongs_to :user
    belongs_to :language
    has_many :likes, dependent: :destroy

    validates_presence_of :title, :description, :content, :language, :tags
    validates :title, :length => {minimum: 5}
    validates :description, :length => {minimum: 20}
    validates :content, :length => {minimum:20}
end

