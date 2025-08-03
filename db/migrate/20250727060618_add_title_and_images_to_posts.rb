class AddTitleAndImagesToPosts < ActiveRecord::Migration[7.2]
  def change
    add_column :posts, :title, :string
    add_column :posts, :postsKey, :string

    (4..10).each do |i|
      add_column :posts, "image#{i}".to_sym, :string
      add_column :posts, "content#{i}".to_sym, :text
    end
  end
end
