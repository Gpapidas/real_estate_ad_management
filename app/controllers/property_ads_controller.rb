class PropertyAdsController < ApplicationController
  before_action :authenticate_user!

  def index
    @ads = if current_user.admin?
             property_ads.all
           else
             current_user.property_ads
           end
  end

  def show
    if current_user.admin?
      @property_ad = PropertyAd.find_by(id: params[:id]) or not_found
    else
      @property_ad = PropertyAd.find_by(user: current_user, id: params[:id]) or not_found
    end
  end

  def new
    @property_ad = PropertyAd.new
  end

  def create
    property_ad_params = property_params
    property_ad_location_params = property_ad_params.delete(:property_ad_location)
    create_property_ad_with_location(property_ad_params, property_ad_location_params)
  end

  def destroy
    @property_ad = if current_user.admin?
                     PropertyAd.find_by(id: params[:id])
                   else
                     PropertyAd.find_by(user: current_user, id: params[:id])
                   end
    @property_ad.destroy
    redirect_to(property_ads_path, notice: 'REA deleted successfully!')
  end

  private

  def create_property_ad_with_location(property_ad_params, property_ad_location_params)
    ActiveRecord::Base.transaction do
      property_ad_location = PropertyAdLocation.create_or_update(property_ad_location_params)

      @property_ad = PropertyAd.new(property_ad_params.merge(user_id: current_user.id, property_ad_location_id: property_ad_location.id))
      @property_ad.save

      raise ActiveRecord::RecordInvalid if @property_ad.errors.any?

      redirect_to(property_ads_path, notice: 'Creation Successful! Congratulations!')
    rescue ActiveRecord::RecordInvalid
      render :new
    end
  end

  def property_params
    params.require('property_ad').permit(
      :title,
      :property_type,
      :price,
      :extra_description,
      property_ad_location: [
        :place_id,
        :area_main_text,
        :area_secondary_text
      ]
    )
  end
end
