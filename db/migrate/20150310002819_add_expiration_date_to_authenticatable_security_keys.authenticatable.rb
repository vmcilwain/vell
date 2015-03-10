# This migration comes from authenticatable (originally 20141001230912)
class AddExpirationDateToAuthenticatableSecurityKeys < ActiveRecord::Migration
  def change
    add_column :authenticatable_security_keys, :expiration_date, :date
  end
end
