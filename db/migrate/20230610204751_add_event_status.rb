class AddEventStatus < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :event_status, :integer, default: 0
  end
end
