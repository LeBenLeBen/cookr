class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :title
      t.timestamps
    end

    create_table :recipes_tags do |t|
      t.belongs_to :recipe
      t.belongs_to :tag
    end
  end
end