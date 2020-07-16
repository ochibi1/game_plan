class CreateArticles < ActiveRecord::Migration[6.0]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body
      t.string :img
      t.references :user

      t.timestamps
    end
  end
end
