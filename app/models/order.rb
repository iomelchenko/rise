# -*- encoding : utf-8 -*-
class Order < ActiveRecord::Base

  has_many :line_items, dependent: :destroy
  belongs_to :paytype
  attr_accessible :address, :email, :name, :paytype_id, :ship_date


  validates :name, :address, :email, presence: true
  validates_presence_of :paytype_id
  validates_associated :paytype


  def add_line_items_from_cart(cart)
      cart.line_items.each do |item|
         item.cart_id = nil
         line_items << item
      end
  end	
end
