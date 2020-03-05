class Admin::DashboardController < ApplicationController
  def show
    @prodcount = Product.count(:id)
    @catcount = Product.distinct.count(:category_id)
  end
end
