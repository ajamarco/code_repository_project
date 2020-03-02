class CreateTagPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :tag_posts do |t|
      t.references :post
      t.references :tag
      t.timestamps
    end
  end
end
