# This migration comes from authenticatable (originally 20140929230800)
class CreateSecurityKey < ActiveRecord::Migration
  def change
    create_table :authenticatable_security_keys do |t|
      t.integer :user_id
      t.string :key
    end
  end
end
