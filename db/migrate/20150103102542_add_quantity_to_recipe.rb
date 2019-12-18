class AddQuantityToRecipe < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :quantity, :int
  end
end
