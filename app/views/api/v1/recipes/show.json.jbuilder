json.id @recipe.id
json.title @recipe.title
json.created_at @recipe.created_at
json.updated_at @recipe.updated_at
json.steps @recipe.steps_as_array
json.time @recipe.time
json.notes @recipe.notes
json.quantity @recipe.quantity
json.user_id @recipe.user_id

json.images do
  json.thumb attachment_url(@recipe.image, :thumb)
  json.medium attachment_url(@recipe.image, :medium)
  json.card attachment_url(@recipe.image, :card)
  json.card_large attachment_url(@recipe.image, :card_large)
end

json.ingredients @recipe.ingredients, :amount, :title
json.tags @recipe.tags, :id, :title
