class AddLevelsAndBathroomsToPropertyAds < ActiveRecord::Migration[7.0]
  def change
    add_column :property_ads, :levels, :integer
    add_column :property_ads, :bathrooms, :integer
  end
end
