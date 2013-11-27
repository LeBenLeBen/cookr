class RecipesTag < ActiveRecord::Base

  belongs_to :recipe
  belongs_to :tag, :counter_cache => :recipe_count

end
