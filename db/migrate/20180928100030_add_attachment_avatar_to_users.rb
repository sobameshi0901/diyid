class AddAttachmentAvatarToUsers < ActiveRecord::Migration[5.2]
  def self.up
    change_table :users do |t|
      t.attachment :avatar
      t.string :nickname
    end
  end

  def self.down
    remove_attachment :users, :avatar
    remove_column :users, :nickname
  end
end
