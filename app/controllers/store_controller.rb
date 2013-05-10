class StoreController < ApplicationController
  skip_before_filter :authorise
  def index
  	@products = Product.order(:title)
  	@cart = current_cart
  end
end
