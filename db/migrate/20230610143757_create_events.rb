class CreateEvents < ActiveRecord::Migration[7.0]
  def change
    create_table :events, id: :uuid do |t|
      t.integer :event_type, null: false
      t.date :start_date, null: false
      t.date :end_date, default: nil
      t.string :name, null: false
      t.text :description, default: ""
      t.integer :status, null: false
      t.boolean :verified, default: false
      t.references :author, index: true, null: false, foreign_key: { to_table: :users }, type: :uuid
      t.references :checker, index: true, foreign_key: { to_table: :users }, type: :uuid, default: nil
      t.timestamps
    end
  end
end
