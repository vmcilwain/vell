# This migration comes from authenticatable (originally 20140925160051)
class CreateAUser < ActiveRecord::Migration
  def up
    Authenticatable::User.create(email: 'admin@example.com', password: 'P*ssw0rd', full_name: 'Example Admin')
  end

  def down
    Authenticatable::User.delete_all
  end
end
