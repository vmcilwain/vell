# @author Lovell McIlwain
# Handles business logic for user
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable#, :registerable
   # validates :first_name, :last_name, presence: true

   # Builds full name from the user object
   # @note method should be in a decorator
   def full_name
     "#{self.first_name} #{self.last_name}"
   end
end
