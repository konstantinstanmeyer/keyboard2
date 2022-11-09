class AddOriginToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :origin, :string
    add_column :users, :view_high_score?, :boolean
    add_column :users, :view_profile?, :boolean
    add_column :users, :view_origin?, :boolean
  end
end
