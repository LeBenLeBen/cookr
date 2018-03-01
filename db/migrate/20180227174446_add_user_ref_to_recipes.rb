class AddUserRefToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_reference :recipes, :user, foreign_key: true
  end
end
