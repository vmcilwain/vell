# This migration comes from authenticatable (originally 20141009235958)
class CreateRoles < ActiveRecord::Migration
  def change
    create_table :authenticatable_roles do |t|
      t.string :name
      t.string :description
      t.timestamps
    end
  end
end
