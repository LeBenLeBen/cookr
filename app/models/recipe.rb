class Recipe < ApplicationRecord
  include AlgoliaSearch

  belongs_to :user, :autosave => true
  has_many :ingredients, :dependent => :destroy
  has_many :recipes_tags, :dependent => :destroy
  has_many :tags,
    :through => :recipes_tags,
    :before_remove => :before_remove_tag,
    :after_remove => :after_remove_tag

  accepts_nested_attributes_for :ingredients,
    :reject_if => :all_blank,
    :allow_destroy => true

  validates :title, presence: true,
                    length: { minimum: 3 }

  has_attached_file :image, :styles => {
    thumb:      '100x66#',
    medium:     '740x494#',
    card:       '544x362#',
    card_large: '604x402#',
  }

  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  algoliasearch per_environment: true do
    attribute :title
    attribute :url do
      Rails.application.routes.url_helpers.recipe_path(self.id)
    end
  end

  def self.alphabetically
    order(:title)
  end

  protected

  def before_remove_tag(tag)
    Tag.decrement_counter(:recipe_count, tag.id)
  end

  def after_remove_tag(tag)
    # This is the last time this tag was used? We destroy it.
    tag.destroy if tag.recipe_count == 1
  end

end
