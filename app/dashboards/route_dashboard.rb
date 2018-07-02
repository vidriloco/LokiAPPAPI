require "administrate/base_dashboard"

class RouteDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    vehicles: Field::HasMany,
    positions: Field::HasMany,
    tracking_allowances: Field::HasMany,
    users: Field::HasMany,
    paths: Field::HasMany,
    authority: Field::BelongsTo,
    id: Field::Number,
    name: Field::String,
    authority_name: Field::String,
    description: Field::String,
    image_url: Field::String,
    is_active: Field::Boolean,
    color: Field::String,
    stroke: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :vehicles,
    :color,
    :stroke,
    :users,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :authority,
    :id,
    :authority_name,
    :description,
    :image_url,
    :is_active,
    :color,
    :stroke,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :authority,
    :name,
    :description,
    :image_url,
    :is_active,
    :color,
    :stroke,
  ].freeze

  # Overwrite this method to customize how routes are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(route)
    route.name
  end
end
