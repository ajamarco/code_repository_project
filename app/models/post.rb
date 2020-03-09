class Post < ApplicationRecord
    has_many :tag_posts
    has_many :tags, through: :tag_posts
    has_many :post_likes
    has_many :comments
    belongs_to :user
    belongs_to :language
    has_many :likes, dependent: :destroy
    accepts_nested_attributes_for :tags

    validates_presence_of :title, :content, :language, :tags
    validates :title, :length => {minimum: 5}
    validates :content, :length => {minimum:5}

    def show_tags
        return_string = ""
        tags = self.tags
        tags.each do |tag|
            return_string += "#{tag.name}, "       
        end
        return_string.strip.chop #getting rid of the last whitespace and the last , using chop
    end

    def self.order_posts(column)
        posts = Post.all.sort_by do |p| 
            if column == "author"
                p.user.name.downcase
            elsif column == "title"
                p.title.downcase
            elsif column == "likes"
                p.likes.count
            elsif column == "language"
                p.language.name.downcase
            else
                p.id
            end
        end
        posts      
    end
end

