json.recipes do
  json.array! @recipes do |recipe|
    json.id recipe.id
    json.title recipe.title
    json.created_at recipe.created_at
    json.updated_at recipe.updated_at
    json.time recipe.time
    json.quantity recipe.quantity
    json.user_id recipe.user_id

    json.images do
      json.thumb attachment_url(recipe.image, :thumb)
      json.card attachment_url(recipe.image, :card)
    end
  end
end
