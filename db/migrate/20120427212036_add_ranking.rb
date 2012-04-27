class AddRanking < ActiveRecord::Migration
  def up
    add_column :rankings, :position, :integer
  end
end
