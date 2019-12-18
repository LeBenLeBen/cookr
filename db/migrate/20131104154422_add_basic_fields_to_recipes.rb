class AddBasicFieldsToRecipes < ActiveRecord::Migration[5.1]
  def change
    add_column :recipes, :steps, :text
    add_column :recipes, :time, :integer
    add_column :recipes, :cooking, :text
    add_column :recipes, :notes, :string
  end
end
