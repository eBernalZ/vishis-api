class AddLanguageToEvent < ActiveRecord::Migration[7.0]
  def change
    add_column :events, :language, :string
    add_column :sources, :language, :string
  end
end
