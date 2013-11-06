class Ingredient < ActiveRecord::Base

  belongs_to :recipe, :autosave => true
  accepts_nested_attributes_for :recipe

  attr_accessible :id, :amount, :title

end
