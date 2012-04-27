class CreateRankingTable < ActiveRecord::Migration
  def change
    create_table :rankings, :id => false do |t|
      t.integer :user_id
      t.integer :suggestion_id
    end
  end
end
