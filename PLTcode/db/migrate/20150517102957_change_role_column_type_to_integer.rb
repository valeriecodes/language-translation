class ChangeRoleColumnTypeToInteger < ActiveRecord::Migration
  def change
    rename_column :users, :role, :bk_role
    add_column :users, :role, :integer

    ## Convert existing values to integer. 
    User.reset_column_information

    User.all.each do |user|
      role_id = Role::ROLES.select {|id, name| name == user.bk_role.try(:downcase).to_sym}.keys.first
      user.update_column(:role, role_id)
    end
  end
end
