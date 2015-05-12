# This migration comes from simple_auth_engine (originally 20150408003613)
class CreateAdminLogin < ActiveRecord::Migration
  def up
    user = SimpleAuthEngine::User.create(full_name: 'Admin User', email: 'admin@example.com', security_question: 'Whats your name?', security_answer: 'admin', password: 'P*ssw0rd', password_confirmation: 'P*ssw0rd')
    
    role = SimpleAuthEngine::Role.create(name: 'administrator', description: 'Simple auth engine administration role')
    
    role.users << user
  end
  
  def down
    role = SimpleAuthEngine::Role.find_by(name: 'administrator')
    user = SimpleAuthEngine::User.find_by(email: 'admin@example.com')
    role.users.delete(user)
    user.destroy
    role.destroy
  end
end
