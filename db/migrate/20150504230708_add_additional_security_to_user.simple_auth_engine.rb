# This migration comes from simple_auth_engine (originally 20150316114342)
class AddAdditionalSecurityToUser < ActiveRecord::Migration
  def change
    add_column :simple_auth_engine_users, :security_question, :string
    add_column :simple_auth_engine_users, :security_answer, :string
  end
end
