class UsersToTests < ActiveRecord::Migration
  def up
    create_table :usersTests do |t|
      t.references :user
      t.references :test
      t.float :result
    end
  end

  def down
  end
end
