class AddHighScoreToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :high_score, :decimal, default: 0.0
  end
end
