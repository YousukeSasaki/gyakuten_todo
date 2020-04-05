class AddDescriptionToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :description, :string, limit: 100, after: :title
  end
end
