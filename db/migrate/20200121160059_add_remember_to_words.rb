class AddRememberToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :remember, :boolean
  end
end
