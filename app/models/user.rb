class User < ActiveRecord::Base
  validates_uniqueness_of :email, :message => "Error. A user with the specified email exists."
  has_secure_password
  validates :password, :presence => true
end
