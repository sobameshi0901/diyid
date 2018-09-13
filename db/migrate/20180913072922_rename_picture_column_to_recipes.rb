class RenamePictureColumnToRecipes < ActiveRecord::Migration[5.2]
  def change
    rename_column :recipes, :picture, :image
  end
end
