class ChangeRanking < ActiveRecord::Migration
  def up
    remove_column :rankings, :position
    add_column :rankings, :position, :string
  end

  def down
  end
end
