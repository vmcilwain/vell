# This migration comes from authenticatable (originally 20150309123410)
class AddAdminUserToRole < ActiveRecord::Migration
  def up
    Authenticatable::Role.create(name: 'Administrator', description: 'Application Administration Role').users << Authenticatable::User.first
  end
  
  def down
    role = Authenticatable::Role.find_by(name: 'Administrator')
    role.users = []
    role.destroy
  end
end
