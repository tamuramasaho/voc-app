class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :name
      t.string :example
      t.string :translation

      t.timestamps
    end
  end
end
