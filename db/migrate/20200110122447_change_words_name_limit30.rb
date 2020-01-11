class ChangeWordsNameLimit30 < ActiveRecord::Migration[5.2]
  def up
    change_column :words, :name, :string, limit: 30
  end
  def down
    change_column :words, :name, :string
  end
end
