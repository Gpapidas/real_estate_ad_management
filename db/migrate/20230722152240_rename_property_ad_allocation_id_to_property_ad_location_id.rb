class RenamePropertyAdAllocationIdToPropertyAdLocationId < ActiveRecord::Migration[7.0]
  def change
    rename_column :property_ads, :property_ad_allocation_id, :property_ad_location_id
  end
end
