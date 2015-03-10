# This migration comes from authenticatable (originally 20140730023605)
class CreateAuthenticatableUsers < ActiveRecord::Migration
  def change
    create_table :authenticatable_users do |t|
      t.string :full_name, :email, :password, :salt

      t.timestamps
    end
  end
end
