class AddCounterCache < ActiveRecord::Migration[5.1]
  def up
    add_column :tags, :recipe_count, :integer, :default => 0

    Tag.reset_column_information
    Tag.all.each do |tag|
      Tag.reset_counters tag.id, :recipes
    end
  end

  def down
    remove_column :tags, :recipe_count
  end
end
