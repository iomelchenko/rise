# -*- encoding : utf-8 -*-
require 'will_paginate/array' 
class StoreController < ApplicationController
  skip_before_filter :authorise
  before_filter :curr_cart

  def curr_cart
    @cart = current_cart
  end

  def index
  	@products = Product.order(:price)
    page  
  end

  def cataloge
    @products = Product.joins(:group).joins(:subgroup).where("subgroups.name" => params[:subgroup]).order(:title)
    page
    render 'store/index'
  end

  private

  def curr_cart
    @cart = current_cart
  end   

  def page
    @products = @products.paginate page: params[:page], order: "price",
              per_page: 4   
  end      
end
