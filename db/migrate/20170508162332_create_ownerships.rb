class CreateOwnerships < ActiveRecord::Migration[5.1]
  def change
    create_table :ownerships do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :vehicle, foreign_key: true

      t.timestamps
    end
  end
end
