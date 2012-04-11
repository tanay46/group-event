class AddColumnForPasswordDigest < ActiveRecord::Migration
  def up
    rename_column :users, :password, :password_digest
  end

  def down
  end
end
