class AddCountryToEvents < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :country, :string, null: false
  end
end
