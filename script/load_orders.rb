# -*- encoding : utf-8 -*-
Order.transaction do
   (1..100).each do |i|
      Order.create(name: "Customer #{i}", address: "#{i} Main Street", 
      	           email: "customer_#{i}@example.com", pay_type: "Check")

   end

end
