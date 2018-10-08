class CreateTagMaps < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_maps do |t|
      t.references :recipe, foreign_key: true, null: false
      t.references :tag, foreign_key: true, null: false

      t.timestamps
      t.index [:recipe_id, :tag_id], unique: true
    end
  end
end
