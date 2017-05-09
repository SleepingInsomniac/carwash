class CreateWashes < ActiveRecord::Migration[5.1]
  def change
    create_table :washes do |t|
      t.belongs_to :vehicle, foreign_key: true
      t.decimal :total, precision: 8, scale: 2, null: false, default: 0
      t.text :description

      t.timestamps
    end
  end
end
