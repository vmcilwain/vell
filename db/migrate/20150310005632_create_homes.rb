class CreateHomes < ActiveRecord::Migration
  def change
    create_table :homes do |t|
      t.text :index
      t.text :about
    end
  end
end
