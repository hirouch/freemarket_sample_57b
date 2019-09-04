class RemoveIntroduceFromUsers < ActiveRecord::Migration[5.0]
  def change
    remove_column :users, :introduce, :text
  end
end
