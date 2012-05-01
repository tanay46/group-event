class Event < ActiveRecord::Base
  
  has_many :suggestions, :dependent => :destroy
  has_many :restaurants, :through => :suggestions
  has_many :invitations, :dependent => :destroy
  has_many :users, :through => :invitations
  
  validates :name, :presence => true
  
  def rankings(user)
    return Ranking.where(:suggestion_id => self.suggestions.collect(&:id), :user_id => user.id)
  end
  
  def top_three_rankings
    users = self.users
    restaurants = Hash.new
    for user in user
      for suggestion in user.suggestions
        if not restaurants[suggestion.restaurant.id]
          restaurants[suggestion.restaurant.id]=rankings.position
        else
          restaurants[suggestion.restaurant.id] += rankings.position
        end
      end
    end
  end
  
end
