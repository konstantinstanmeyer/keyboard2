class AddAccuracyToScores < ActiveRecord::Migration[7.0]
  def change
    add_column :scores, :accuracy, :integer
  end
end
