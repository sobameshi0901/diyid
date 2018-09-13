class AddlargeCategoryIdToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :large_category_id, :integer
  end
end
