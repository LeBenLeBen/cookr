namespace :recipes do
  desc "Assign orphan recipes to the first user"
  task assign_orphan_recipes: :environment do
    user = User.first
    Recipe.where(user_id: nil).update(user: user)
  end
end
