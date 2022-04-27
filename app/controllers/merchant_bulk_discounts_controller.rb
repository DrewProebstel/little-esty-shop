class MerchantBulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(params[:id])
    @holidays = HolidayFacade.new
  end

  def create
    @merchant = Merchant.find(params[:id])
    bulk_discount = @merchant.bulk_discounts.create(bulk_discount_params)
    redirect_to "/merchants/#{@merchant.id}/bulk_discounts"
  end

  def new
    @merchant = Merchant.find(params[:id])
  end

  def show
    @bulk_discount = BulkDiscount.find(params[:bulk_discounts_id])
    @merchant = Merchant.find(params[:id])
  end

  def destroy
    BulkDiscount.find(params[:to_delete]).delete
    redirect_to "/merchants/#{params[:id]}/bulk_discounts"
  end

  def edit
    @bulk_discount = BulkDiscount.find(params[:bulk_discounts_id])
  end

  def update
    bulk_discount = BulkDiscount.find(params[:bulk_discounts_id])
    bulk_discount.update(percentage_discount: params[:percentage_discount])
    bulk_discount.update(quantity_threshold: params[:quantity_threshold])
    redirect_to "/merchants/#{params[:id]}/bulk_discounts/#{params[:bulk_discounts_id]}"
  end
end
private
def bulk_discount_params
  params.permit(:percentage_discount, :quantity_threshold)
end
