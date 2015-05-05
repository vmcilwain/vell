# This migration comes from simple_auth_engine (originally 20141009235958)
class CreateSimpleAuthEngineRoles < ActiveRecord::Migration
  def change
    create_table :simple_auth_engine_roles do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
