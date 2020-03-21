class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :title, null: false, limit: 30
      t.datetime :deadline, null: false
      t.integer :integer
      t.timestamps
    end
  end
end