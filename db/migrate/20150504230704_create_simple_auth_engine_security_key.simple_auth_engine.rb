# This migration comes from simple_auth_engine (originally 20140929230800)
class CreateSimpleAuthEngineSecurityKey < ActiveRecord::Migration
  def change
    create_table :simple_auth_engine_security_keys do |t|
      t.integer :user_id
      t.string :key
    end
  end
end
