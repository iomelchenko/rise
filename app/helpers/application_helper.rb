module ApplicationHelper

	def hidden_div_if(condition, attributes = {}, &block)
	   
	   if condition 
	      attributes["style"] = "display: none"
	   end	

	   content_tag("div", attributes, &block)

	end
	def example(options={}, &block)
		    out = render :partial => 'products/header', :locals => {:options => options}
		    out << capture(&block)
		    out
    end

end
