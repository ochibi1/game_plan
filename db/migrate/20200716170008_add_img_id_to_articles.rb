class AddImgIdToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :img_id, :string
  end
end
