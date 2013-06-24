# -*- encoding : utf-8 -*-
require 'will_paginate/array' 
class StoreController < ApplicationController
  skip_before_filter :authorise
  before_filter :curr_cart

  def curr_cart
    @cart = current_cart
  end

  def index
  	@products = Product.order(:title)
    page  
  end

  def cosm1
  	@products = Product.cosm_1
    page
    render 'store/index'
  end
  def cosm11
  	@products = Product.cosm_11
    page
    render 'store/index'
  end
  def cosm12
  	@products = Product.cosm_12
    page
    render 'store/index'
  end
  def cosm13
  	@products = Product.cosm_13
    page
    render 'store/index'
  end   
  def cosm14
  	@products = Product.cosm_14
    page
    render 'store/index'
  end   


  
  def lingerie1
    @products = Product.lingerie_1
    page
    render 'store/index'
  end   
  def lingerie11
    @products = Product.lingerie_11
    page
    render 'store/index'
  end   
  def lingerie12
    @products = Product.lingerie_12
    render 'store/index'
  end   
  def lingerie13
    @products = Product.lingerie_13
    page
    render 'store/index'
  end   



  def parfum1
    @products = Product.parfum_1
    page
    render 'store/index'
  end   
  def parfum11
    @products = Product.parfum_11
    page
    render 'store/index'
  end 
  def parfum12
    @products = Product.parfum_12
    page
    render 'store/index'
  end 
  def parfum13
    @products = Product.parfum_13
    page
    render 'store/index'
  end 



  def toys1
    @products = Product.toys_1
    page
    render 'store/index'
  end  
  def toys11
    @products = Product.toys_11
    page
    render 'store/index'
  end 
  def toys12
    @products = Product.toys_12
    page
    render 'store/index'
  end 
  def toys13
    @products = Product.toys_13
    page
    render 'store/index'
  end 
  def toys14
    @products = Product.toys_14
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
