class RemoveCategoriesIdFromCategory < ActiveRecord::Migration[5.2]
  def change
    remove_column :categories, :categories_id
  end
end
