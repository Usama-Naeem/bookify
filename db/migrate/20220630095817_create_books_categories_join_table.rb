class CreateBooksCategoriesJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :books, :categories
  end
end
