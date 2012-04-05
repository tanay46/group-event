class Restaurant < ActiveRecord::Base
  attr_accessible :name, :address
  has_many :suggestions, :dependent => :destroy
  has_many :events, :through => :suggestions
  validates :name, :presence => true
end
