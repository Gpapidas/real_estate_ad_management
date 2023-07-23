# == Schema Information
#
# Table name: property_ads
#
#  id                      :bigint           not null, primary key
#  bathrooms               :integer
#  extra_description       :string
#  image                   :string
#  levels                  :integer
#  price                   :float            not null
#  property_type           :string           not null
#  title                   :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  property_ad_location_id :integer          not null
#  user_id                 :integer          not null
#
class PropertyAd < ApplicationRecord
  enum property_type: { rent: 'Rent', buy: 'Buy', exchange: 'Exchange', donation: 'Donation' }
  validates :title, presence: true, length: { maximum: 155 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, format: { with: /\A\d+(\.\d{1,2})?\z/, message: "should have up to two decimals" }
  validates :levels, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 163, allow_nil: true }
  validates :bathrooms, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 200, allow_nil: true }

  belongs_to :property_ad_location
  belongs_to :user
  mount_uploader :image, ImageUploader
end
