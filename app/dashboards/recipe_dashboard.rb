require 'administrate/base_dashboard'

class RecipeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    ingredients: Field::HasMany,
    recipes_tags: Field::HasMany,
    tags: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    steps: Field::Text,
    time: Field::Number,
    notes: Field::String,
    image_file_name: Field::String,
    image_content_type: Field::String,
    image_file_size: Field::Number,
    image_updated_at: Field::DateTime,
    quantity: Field::Number
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[id title user created_at updated_at].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    user
    ingredients
    recipes_tags
    tags
    id
    title
    created_at
    updated_at
    steps
    time
    notes
    image_file_name
    image_content_type
    image_file_size
    image_updated_at
    quantity
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    user
    ingredients
    recipes_tags
    tags
    title
    steps
    time
    notes
    image_file_name
    image_content_type
    image_file_size
    image_updated_at
    quantity
  ].freeze

  # Overwrite this method to customize how recipes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(recipe)
  #   "Recipe ##{recipe.id}"
  # end
end
