class RenameTypeColumnInPropertyAds < ActiveRecord::Migration[7.0]
  def change
    rename_column :property_ads, :type, :property_type
  end
end
