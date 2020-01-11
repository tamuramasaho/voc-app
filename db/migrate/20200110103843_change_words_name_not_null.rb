class ChangeWordsNameNotNull < ActiveRecord::Migration[5.2]
  def change
    change_column_null :words, :name, false
  end
end
