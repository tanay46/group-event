class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :name, :role
  validates_uniqueness_of :email, :message => "Error. A user with the specified email exists."
  has_secure_password
  validates_presence_of :password, :on => :create
  
  has_many :invitations, :dependent => :destroy
  has_many :events, :through => :invitations
  has_many :rankings
end
