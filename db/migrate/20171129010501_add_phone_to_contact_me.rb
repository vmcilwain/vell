class AddPhoneToContactMe < ActiveRecord::Migration[5.1]
  def change
    add_column :contact_mes, :phone, :string
  end
end
