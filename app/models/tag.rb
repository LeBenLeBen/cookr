class Tag < ActiveRecord::Base

  has_many :recipes_tags, :dependent => :destroy
  has_many :recipes, :through => :recipes_tags

  validates_uniqueness_of :title

end
