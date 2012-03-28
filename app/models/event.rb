class Event < ActiveRecord::Base
  has_many :suggestions, :dependent => :destroy
  has_many :restaurants, :through => :suggestions
end
