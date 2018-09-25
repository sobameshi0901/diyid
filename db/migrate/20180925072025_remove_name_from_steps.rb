class RemoveNameFromSteps < ActiveRecord::Migration[5.2]
  def change
    remove_column :steps, :name, :string
  end
end
