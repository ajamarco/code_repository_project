class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.text :description
      t.text :content
      t.integer :likes, default: 0
      t.references :language

      t.timestamps
    end
  end
end
