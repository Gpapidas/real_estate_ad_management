class CreatePropertyAdAllocations < ActiveRecord::Migration[7.0]
  def change
    create_table :property_ad_allocations do |t|
      t.string :place_id, null: false
      t.string :area_main_text, null: false
      t.string :area_secondary_text, null: false

      t.timestamps
    end
  end
end
