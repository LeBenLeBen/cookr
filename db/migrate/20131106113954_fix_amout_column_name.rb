class FixAmoutColumnName < ActiveRecord::Migration
  def change
    rename_column :ingredients, :amout, :amount
  end
end
