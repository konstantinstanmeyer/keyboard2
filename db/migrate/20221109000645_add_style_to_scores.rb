class AddStyleToScores < ActiveRecord::Migration[7.0]
  def change
    add_column :scores, :style, :string
  end
end
