class CreateRecipes < ActiveRecord::Migration[5.2]
  def change
    create_table :recipes do |t|
      t.string :name, null:false
      t.string :build_time, null:false
      t.string :cost, null:false
      t.text   :comment, null:false
      t.text   :point, null:false
      t.text   :picture, null:false, unique: true
      t.text   :size, null:false
      t.integer    :viewed
      t.timestamps
    end
  end
end
