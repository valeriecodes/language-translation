class RemoveRolesFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :role_id, :integer
    remove_column :users, :bk_role, :string
  end
end
