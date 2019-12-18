class FixAmoutColumnName < ActiveRecord::Migration[5.1]
  def change
    rename_column :ingredients, :amout, :amount
  end
end
