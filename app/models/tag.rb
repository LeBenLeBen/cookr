class Tag < ActiveRecord::Base

  has_and_belongs_to_many :recipes

  attr_accessible :title

  validates_uniqueness_of :title

end
