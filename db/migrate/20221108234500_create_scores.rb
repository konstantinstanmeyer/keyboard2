class CreateScores < ActiveRecord::Migration[7.0]
  def change
    create_table :scores do |t|
      t.decimal :score
      t.integer :user_id

      t.timestamps
    end
  end
end
