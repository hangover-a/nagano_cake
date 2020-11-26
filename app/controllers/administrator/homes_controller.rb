class Administrator::HomesController < ApplicationController

  def top
    now = Time.current
    @orders = Order.where(created_at: now.all_day)
  end

end
