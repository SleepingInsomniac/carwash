class CreateBlacklists < ActiveRecord::Migration[5.1]
  def change
    create_table :blacklists do |t|
      t.string :license, null: false, index: true

      t.timestamps
    end
  end
end
