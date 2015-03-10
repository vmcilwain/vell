# This migration comes from authenticatable (originally 20141010002823)
class CreateRolesUsers < ActiveRecord::Migration
  def change
    create_table :authenticatable_roles_users, id: false do |t|
      t.integer :role_id
      t.integer :user_id
    end
  end
end
