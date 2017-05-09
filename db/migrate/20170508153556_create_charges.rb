class CreateCharges < ActiveRecord::Migration[5.1]
  def change
    create_table :charges do |t|
      t.text :description
      t.decimal :amount, precision: 8, scale: 2, default: 0, null: false
      t.belongs_to :wash, foreign_key: true

      t.timestamps
    end
  end
end
