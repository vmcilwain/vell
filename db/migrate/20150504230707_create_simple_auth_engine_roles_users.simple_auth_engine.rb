# This migration comes from simple_auth_engine (originally 20141010002823)
class CreateSimpleAuthEngineRolesUsers < ActiveRecord::Migration
  def change
    create_table :simple_auth_engine_roles_users, id: false do |t|
      t.integer :role_id
      t.integer :user_id
    end
  end
end
