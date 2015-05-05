# This migration comes from simple_auth_engine (originally 20141001230912)
class AddExpirationDateToSimpleAuthEngineSecurityKeys < ActiveRecord::Migration
  def change
    add_column :simple_auth_engine_security_keys, :expiration_date, :date
  end
end
