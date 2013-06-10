class StoreController < ApplicationController
  skip_before_filter :authorise


  def index
  	@products = Product.order(:title)
  	@cart = current_cart
  end



  def cosm1
  	@products = Product.where(:id => 10).order(:title)
  	@cart = current_cart
    render 'store/index'
  end
  def cosm11
  	@products = Product.where(:id => 10).order(:title)
  	@cart = current_cart
    render 'store/index'
  end
  def cosm12
  	@products = Product.where(:id => 10).order(:title)
  	@cart = current_cart
    render 'store/index'
  end
  def cosm13
  	@products = Product.where(:id => 10).order(:title)
  	@cart = current_cart
    render 'store/index'
  end   
  def cosm14
  	@products = Product.where(:id => 10).order(:title)
  	@cart = current_cart
    render 'store/index'
  end   


  
  def lingerie1
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end   
  def lingerie11
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end   
  def lingerie12
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end   
  def lingerie13
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end   



  def parfum1
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end   
  def parfum11
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end 
  def parfum12
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end 
  def parfum13
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end 



  def toys1
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end  
  def toys11
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end 
  def toys12
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end 
  def toys13
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end 
  def toys14
    @products = Product.where(:id => 10).order(:title)
    @cart = current_cart
    render 'store/index'
  end         
end
