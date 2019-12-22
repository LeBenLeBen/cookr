class Ingredient < ApplicationRecord
  belongs_to :recipe, autosave: true
  accepts_nested_attributes_for :recipe
end
