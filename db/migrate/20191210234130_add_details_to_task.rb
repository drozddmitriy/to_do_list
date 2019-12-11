class AddDetailsToTask < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :complete, :boolean, default: false
    add_column :tasks, :position, :integer
    add_column :tasks, :deadline, :datetime
  end
end
