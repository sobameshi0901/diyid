class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name, null:false
      t.string :build_time, null:false
      t.string :cost, null:false
      t.text   :comment, null:false
      t.text   :point, null:false
      t.text   :image, null:false, unique: true
      t.text   :size, null:false
      t.references :category, null:false, foregin_key: true
      t.references :user, null:false, foregin_key: true
      t.integer    :viewed
      t.timestamps
    end
  end
end
