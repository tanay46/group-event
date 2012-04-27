class Restaurant < ActiveRecord::Base
  
  has_many :suggestions, :dependent => :destroy
  has_many :events, :through => :suggestions
  has_many :rankings, :through => :suggestions
  
  validates :name, :presence => true
end
