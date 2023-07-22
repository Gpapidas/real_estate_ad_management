class AddIndexToPropertyAdAllocations < ActiveRecord::Migration[7.0]
  def change
    add_index :property_ad_allocations, :place_id, unique: true
  end
end
