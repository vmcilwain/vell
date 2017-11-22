# This migration comes from simple_auth_engine (originally 20150320231435)
class CreateSimpleAuthEngineUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :simple_auth_engine_users do |t|
      t.string :full_name, :email, :password_hash, :salt, :security_question, :security_answer, :reset_key, :reset_key_expiration
      t.timestamps null: false
    end
  end
end
