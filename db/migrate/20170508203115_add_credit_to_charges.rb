class AddCreditToCharges < ActiveRecord::Migration[5.1]
  def change
    add_column :charges, :is_credit, :boolean, null: false, default: false
  end
end
