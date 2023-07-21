# == Schema Information
#
# Table name: property_ad_allocations
#
#  id                  :bigint           not null, primary key
#  area_main_text      :string           not null
#  area_secondary_text :string           not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  place_id            :string           not null
#
class PropertyAdAllocation < ApplicationRecord
  has_many :property_ads, dependent: :destroy
end
