# == Schema Information
#
# Table name: property_ads
#
#  id                        :bigint           not null, primary key
#  extra_description         :string
#  price                     :float            not null
#  title                     :string           not null
#  type                      :string           not null
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#  property_ad_allocation_id :integer          not null
#  user_id                   :integer          not null
#
class PropertyAd < ApplicationRecord
  belongs_to :property_ad_allocation
  belongs_to :user
end
