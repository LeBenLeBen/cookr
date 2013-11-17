class Recipe < ActiveRecord::Base

  has_many :ingredients, :dependent => :destroy
  has_and_belongs_to_many :tags

  accepts_nested_attributes_for :ingredients,
    :reject_if => :all_blank,
    :allow_destroy => true

  attr_accessible :title,
    :steps,
    :time,
    :cooking,
    :notes,
    :ingredients_attributes,
    :tag_list

  validates :title, presence: true,
                    length: { minimum: 3 }

  def tag_list
    self.tags.map { |t| t.title }.join(", ")
  end

  def tag_list=(new_value)
    tag_names = new_value.split(/,\s+/)
    self.tags = tag_names.map { |title| Tag.where('title = ?', title).first or Tag.create(:title => title) }
  end

end
