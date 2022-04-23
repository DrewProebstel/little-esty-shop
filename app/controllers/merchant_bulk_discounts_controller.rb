class MerchantBulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
  end

  def create
    @merchant = Merchant.find(params[:id])
    bulk_discount = @merchant.bulk_discounts.create(bulk_discount_params)
    redirect_to "/merchants/#{@merchant.id}/bulk_discounts"
  end

  def new
    @merchant = Merchant.find(params[:id])
  end

  def destroy
    BulkDiscount.find(params[:to_delete]).delete
    redirect_to "/merchants/#{params[:id]}/bulk_discounts"
  end
end
private
def bulk_discount_params
  params.permit(:percentage_discount, :quantity_threshold)
end
