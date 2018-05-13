require "administrate/base_dashboard"

class PositionDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    vehicle: Field::BelongsTo,
    route: Field::BelongsTo,
    user: Field::BelongsTo,
    id: Field::Number,
    coordinates: Field::String.with_options(searchable: false),
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :vehicle,
    :route,
    :user,
    :id,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :vehicle,
    :route,
    :user,
    :id,
    :coordinates,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :vehicle,
    :route,
    :user,
    :coordinates,
  ].freeze

  # Overwrite this method to customize how positions are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(position)
  #   "Position ##{position.id}"
  # end
end
