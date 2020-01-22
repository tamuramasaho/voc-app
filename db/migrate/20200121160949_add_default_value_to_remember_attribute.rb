class AddDefaultValueToRememberAttribute < ActiveRecord::Migration[5.2]
  def up
    change_column :words, :remember, :boolean, default: false
  end

  def down
    change_column :words, :remember, :boolean, default: nil
  end

end
