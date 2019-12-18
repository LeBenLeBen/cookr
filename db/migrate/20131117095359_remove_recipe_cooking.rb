class RemoveRecipeCooking < ActiveRecord::Migration[5.1]
  def up
    remove_column :recipes, :cooking
  end

  def down
    add_column :recipes, :cooking
  end
end
