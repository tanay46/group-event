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
      rankings = rankings(user)
      if not restaurants[rankings.suggestion.restaurant.id]
        restaurants[rankings.suggestion.restaurant.id]=rankings.position
      else
        restaurants[rankings.suggestion.restaurant.id] += rankings.position
      end    
    end
  end
  
end
