class ApplicationController < ActionController::Base
  before_filter :authorise
  protect_from_forgery



    protected
	    def authorise
	    	unless User.find_by_id(session[:user_id])
	    	  redirect_to login_url, notice: "Register please"
	        end
	    end	

	private

	      def current_cart

	      	Cart.find(session[:cart_id])

	       rescue ActiveRecord::RecordNotFound
	      
	             cart = Cart.create
	             session[:cart_id] = cart.id

	             cart

	      end    


end
