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
    property_ad_allocation_params = property_ad_params.delete(:property_ad_allocation)

    ActiveRecord::Base.transaction do
      property_ad_allocation = PropertyAdAllocation.create_or_update(property_ad_allocation_params)

      @property_ad = PropertyAd.new(property_ad_params)
      @property_ad.user_id = current_user.id
      @property_ad.property_ad_allocation_id = property_ad_allocation.id
      @property_ad.save

      raise ActiveRecord::RecordInvalid if @property_ad.errors.any?

      redirect_to(property_ads_path, notice: 'Creation Successful! Congratulations!')
    rescue ActiveRecord::RecordInvalid
      render :new
    end
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

  def property_params
    params.require('property_ad').permit(
      :title,
      :property_type,
      :price,
      :extra_description,
      property_ad_allocation: [
        :place_id,
        :area_main_text,
        :area_secondary_text,
      ]
    )
  end
end
