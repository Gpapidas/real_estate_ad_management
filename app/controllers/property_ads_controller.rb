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

  def create
    @ad = PropertyAd.new(property_ad_params)
    @ad.user_id = current_user.id

    if @ad.save
      redirect_to(property_ads_path, notice: 'Congratulations! You created a Tip!')
    else
      redirect_to(property_ads_path, notice: 'There was a problem with the creation! Please try again later!')
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

  def property_ad_params
    params.permit(:title, :property_type, :property_ad_allocation_id, :price, :extra_description)
  end
end
