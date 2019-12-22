require 'test_helper'

class RecipeTest < ActiveSupport::TestCase
  test 'user can only destroy recipes which they own' do
    jessica = users(:jessica)
    ability = Ability.new(jessica)
    assert ability.can?(:destroy, Recipe.new(user: jessica))
    assert ability.cannot?(:destroy, Recipe.new)
  end

  test 'user can only update recipes which they own' do
    jessica = users(:jessica)
    ability = Ability.new(jessica)
    assert ability.can?(:update, Recipe.new(user: jessica))
    assert ability.cannot?(:update, Recipe.new)
  end
end
