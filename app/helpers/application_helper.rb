# -*- encoding : utf-8 -*-
module ApplicationHelper

	def hidden_div_if(condition, attributes = {}, &block)
	   
	   if condition 
	      attributes["style"] = "display: none"
	   end	

	   content_tag("div", attributes, &block)

	end
	def cataloge(options={}, &block)
		    out = render :partial => 'products/header', :locals => {:options => options}
		    out << capture(&block)
		    out
    end

    

	def javascript(*files)
	  content_for(:head) { javascript_include_tag(*files) }
	end

	def stylesheet(*files)
	  content_for(:head) { stylesheet_link_tag(*files) }
	end



end
