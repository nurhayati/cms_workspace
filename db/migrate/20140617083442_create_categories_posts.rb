class CreateCategoriesPosts < ActiveRecord::Migration
  def change
    create_table :category do |t|
      t.string :name
      t.timestamps
    end

    create_table :post do |t|
      t.string :title
      t.string :body
      t.timestamps
    end

    create_table :categories_posts, id: false do |t|
      t.belongs_to :category
      t.belongs_to :post
    end
  end
end
