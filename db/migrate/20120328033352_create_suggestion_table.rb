class CreateSuggestionTable < ActiveRecord::Migration
  def change
    create_table :suggestions, :id => false do |t|
      t.integer :event_id
      t.integer :restaurant_id
    end
  end
end