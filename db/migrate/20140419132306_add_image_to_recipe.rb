class AddImageToRecipe < ActiveRecord::Migration[5.1]
  def self.up
    add_attachment :recipes, :image
  end

  def self.down
    remove_attachment :recipes, :image
  end
end
