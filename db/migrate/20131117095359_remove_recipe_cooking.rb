class RemoveRecipeCooking < ActiveRecord::Migration
  def up
    remove_column :recipes, :cooking
  end

  def down
    add_column :recipes, :cooking
  end
end
