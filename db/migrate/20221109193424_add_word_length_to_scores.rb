class AddWordLengthToScores < ActiveRecord::Migration[7.0]
  def change
    add_column :scores, :word_length, :integer
  end
end