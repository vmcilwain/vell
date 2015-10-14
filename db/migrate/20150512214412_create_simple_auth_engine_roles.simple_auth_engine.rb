# This migration comes from simple_auth_engine (originally 20150404164424)
class CreateSimpleAuthEngineRoles < ActiveRecord::Migration
  def change
    create_table :simple_auth_engine_roles do |t|
      t.string :name, :description
      t.timestamps null: false
    end
  end
end
