class CreateAnswers < ActiveRecord::Migration
  def up
    create_table :answers do |t|
      t.string answer
      t.references :question
    end
  end

  def down
  end
end
