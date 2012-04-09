class CreateQuestions < ActiveRecord::Migration
  def up
    create_table :questions do |t|
      t.string :question
      t.references :test
      t.references :answer
    end
  end

  def down
  end
end
