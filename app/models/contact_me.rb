class ContactMe < ActiveRecord::Base
  validates :name, :email, :body, presence: true
end