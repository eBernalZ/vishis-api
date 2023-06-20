class CreateSources < ActiveRecord::Migration[7.0]
  def change
    create_table :sources, id: :uuid do |t|
      t.references :event, index: true, null: false, foreign_key: true, type: :uuid
      t.string :name, null: false
      t.text :description, default: ""
      t.integer :source_type, null: false
      t.string :url, default: nil
      t.boolean :verified, default: false
      t.references :author, index: true, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :checker, index: true, foreign_key: { to_table: :users }, type: :uuid, default: nil
      t.timestamps
    end
  end
end
