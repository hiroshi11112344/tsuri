class CreatePosts < ActiveRecord::Migration[7.2]
  def change
    create_table :posts do |t|
      t.string :image1
      t.text :content1
      t.string :image2
      t.text :content2
      t.string :image3
      t.text :content3

      t.timestamps
    end
  end
end
