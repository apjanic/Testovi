class CreateTests < ActiveRecord::Migration
  def up
    create_table :tests do |t|
      t.string :name
      t.string :description
      t.references :category
      t.references :user
      t.date  :dateStart
      t.date  :dateEnd
      t.boolean :active
    end
  end

  def down
  end
end
