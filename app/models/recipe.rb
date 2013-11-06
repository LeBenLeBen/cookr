class Recipe < ActiveRecord::Base

  has_many :ingredients, :dependent => :destroy
  accepts_nested_attributes_for :ingredients,
                                :reject_if => :all_blank,
                                :allow_destroy => :true
  attr_protected :id

  validates :title, presence: true,
                    length: { minimum: 3 }

end
