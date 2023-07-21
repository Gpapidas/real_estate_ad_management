# == Schema Information
#
# Table name: property_ads
#
#  id                        :bigint           not null, primary key
#  extra_description         :string
#  price                     :float            not null
#  property_type             :string           not null
#  title                     :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  property_ad_allocation_id :integer          not null
#  user_id                   :integer          not null
#
class PropertyAd < ApplicationRecord
  enum property_type: { rent: 'Rent', buy: 'Buy', exchange: 'Exchange', donation: 'Donation' }
  validates :title, presence: true, length: { maximum: 155 }

  belongs_to :property_ad_allocation
  belongs_to :user
end
