require "administrate/base_dashboard"

class VehicleDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    positions: Field::HasMany,
    route: Field::BelongsTo,
    id: Field::Number,
    identifier: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    coordinates: Field::String.with_options(searchable: false),
    last_position: Field::String,
    latitude: Field::String,
    longitude: Field::String,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :identifier,
    :last_position,
    :route,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :last_position,
    :route,
    :id,
    :identifier,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :latitude,
    :longitude,
    :route,
    :identifier,
  ].freeze

  # Overwrite this method to customize how vehicles are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(vehicle)
  #   "Vehicle ##{vehicle.id}"
  # end
end
