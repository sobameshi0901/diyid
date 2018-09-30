class Createfavorites < ActiveRecord::Migration[5.2]
  def change
    create_table :favorites do |t|
      t.references :user, null: false
      t.references :recipe, null: false
      t.timestamps

      t.index [:user_id, :recipe_id], unique: true
    end
  end
end
