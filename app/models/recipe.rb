class Recipe < ActiveRecord::Base

  has_many :ingredients, :dependent => :destroy
  has_many :recipes_tags, :dependent => :destroy
  has_many :tags,
    :through => :recipes_tags,
    :before_remove => :before_remove_tag,
    :after_remove => :after_remove_tag

  accepts_nested_attributes_for :ingredients,
    :reject_if => :all_blank,
    :allow_destroy => true

  attr_accessible :title,
    :steps,
    :time,
    :notes,
    :ingredients_attributes,
    :tag_list,
    :tag_count

  validates :title, presence: true,
                    length: { minimum: 3 }

  def self.alphabetically
    order(:title).group_by { |r| r.title[0] }
  end

  def tag_list
    self.tags.map { |t| t.title }.join(", ")
  end

  def tag_list=(new_value)
    tag_names = new_value.split(/,\s+/)
    self.tags = tag_names.map { |title| Tag.where('title = ?', title).first or Tag.create(:title => title) }
  end


  protected

  def before_remove_tag(tag)
    Tag.decrement_counter(:recipe_count, tag.id)
  end

  def after_remove_tag(tag)
    # This is the last time this tag was used? We destroy it.
    tag.destroy if tag.recipe_count == 1
  end

end
