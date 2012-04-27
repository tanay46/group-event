class ChangeUsers < ActiveRecord::Migration
  def change
    remove_column :events, :date
    remove_column :events, :start
    add_column :events, :date, :datetime
  end
end
