class AddStatusToSource < ActiveRecord::Migration[7.0]
  def change
    add_column :sources, :status, :integer, default: 0
  end
end
