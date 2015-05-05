# This migration comes from simple_auth_engine (originally 20140730023605)
class CreateSimpleAuthEngineUsers < ActiveRecord::Migration
  def change
    create_table :simple_auth_engine_users do |t|
      t.string :full_name, :email, :password, :salt

      t.timestamps
    end
  end
end
