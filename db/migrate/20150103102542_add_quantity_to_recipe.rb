class AddQuantityToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :quantity, :int
  end
end
