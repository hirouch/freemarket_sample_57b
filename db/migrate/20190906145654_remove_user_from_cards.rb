class RemoveUserFromCards < ActiveRecord::Migration[5.0]
  def change
    remove_column :cards, :user, :integer
  end
end
