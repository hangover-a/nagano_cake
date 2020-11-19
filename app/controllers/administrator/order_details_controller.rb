class Administrator::OrderDetailsController < ApplicationController
  def update
    @oreder_detail = OrderDetail.find(params[:id])
    @order_detail.update(order_detail_params)
  end
  private
  def order_detail_params
    params.require(:oreder_detail).permit(:making_status)
  end
end
