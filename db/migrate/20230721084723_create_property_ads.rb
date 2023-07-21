class CreatePropertyAds < ActiveRecord::Migration[7.0]
  def change
    create_table :property_ads do |t|
      t.string :title, null: false
      t.string :type, null: false
      t.integer :property_ad_allocation_id, null: false
      t.integer :user_id, null: false
      t.float :price, null: false
      t.string :extra_description

      t.timestamps
    end
  end
end
