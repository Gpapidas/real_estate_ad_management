# == Schema Information
#
# Table name: property_ad_locations
#
#  id                  :bigint           not null, primary key
#  area_main_text      :string           not null
#  area_secondary_text :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  place_id            :string           not null
#
# Indexes
#
#  index_property_ad_locations_on_place_id  (place_id) UNIQUE
#
class PropertyAdLocation < ApplicationRecord
  has_many :property_ads, dependent: :destroy

  def self.create_or_update(params)
    place_id = params[:place_id]

    property_ad_location = find_by(place_id: place_id)
    
    if property_ad_location.present?
      # When you call update on a record, ActiveRecord will first check if any attributes have been modified. 
      # If there are no changes to the attributes, it will skip the update operation, resulting in no query 
      # being executed on the database.
      property_ad_location.update!(params)
    else
      property_ad_location = create!(params)
    end

    property_ad_location
  end
end
