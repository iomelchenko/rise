# -*- encoding : utf-8 -*-
class Cart < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :line_items, dependent: :destroy

  def add_product(product_id, product_price, subcode, quantity)
     quantity ||= 1
     subcode ||= 0
     @current_item = line_items.where(product_id: product_id).where(subcode_prod_id: subcode).first
     
     if @current_item
     	@current_item.quantity += quantity
     else
     	@current_item = line_items.build(product_id: product_id, price: product_price, subcode_prod_id: subcode, quantity: quantity)
     end
     
     @current_item	

  end	

def total_price
   
   line_items.to_a.sum { |item| item.total_price }

end  

end
