class AddPrivateToUser < ActiveRecord::Migration
  def change
    add_column :users, :settings_private, :boolean
  end
end
