# This migration comes from simple_auth_engine (originally 20150404165116)
class CreateRolesUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_auth_engine_roles_users, id: false do |t|
      t.integer :role_id, :user_id
    end
  end
end
