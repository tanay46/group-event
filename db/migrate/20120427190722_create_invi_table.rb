class CreateInviTable < ActiveRecord::Migration
  def change
    create_table :invitations, :id => false do |t|
      t.integer :event_id
      t.integer :user_id
    end
  end
end
