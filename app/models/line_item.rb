# -*- encoding : utf-8 -*-
class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity, :price, :order_id, :subcode_prod_id
  belongs_to :product
  belongs_to :cart
  belongs_to :order
  belongs_to :subcode_prod

  def total_price
     product.price * quantity
  end	
end
