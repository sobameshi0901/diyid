class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.references :question, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :context, null: false
      t.integer :is_recipe_user, null: false
      t.integer :is_first, null: false


      t.timestamps
    end
  end
end
