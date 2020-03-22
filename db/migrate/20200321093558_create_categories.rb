class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name
      t.string :color_name
      t.string :color_code
      t.timestamps
    end
  end
end
