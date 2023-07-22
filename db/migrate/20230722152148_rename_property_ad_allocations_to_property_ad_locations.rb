class RenamePropertyAdAllocationsToPropertyAdLocations < ActiveRecord::Migration[7.0]
  def change
    rename_table :property_ad_allocations, :property_ad_locations
  end
end
