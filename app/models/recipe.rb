class Recipe < ActiveRecord::Base

  has_many :ingredients, :dependent => :destroy
  has_many :recipes_tags, :dependent => :destroy
  has_many :tags, :through => :recipes_tags

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
    order(:title).group_by{|r| r.title[0]}
  end

  def tag_list
    self.tags.map { |t| t.title }.join(", ")
  end

  def tag_list=(new_value)
    tag_names = new_value.split(/,\s+/)
    self.tags = tag_names.map { |title| Tag.where('title = ?', title).first or Tag.create(:title => title) }
  end

end
