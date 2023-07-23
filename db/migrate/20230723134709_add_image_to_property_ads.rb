class AddImageToPropertyAds < ActiveRecord::Migration[7.0]
  def change
    add_column :property_ads, :image, :string
  end
end
