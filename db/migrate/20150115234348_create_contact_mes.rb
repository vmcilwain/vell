class CreateContactMes < ActiveRecord::Migration[5.1]
  def change
    create_table :contact_mes do |t|
      t.string :name, :email
      t.text :body
      t.timestamps
    end
  end
end
