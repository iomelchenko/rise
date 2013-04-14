require 'test_helper'

class ProductTest < ActiveSupport::TestCase
   test "products attributes must not be empty" do
      product = Product.new
      assert product.invalid?
      assert product.errors[:title].any?
      assert product.errors[:description].any?
      assert product.errors[:price].any?
      assert product.errors[:image_url].any?

   end

   test "products price should not be negative" do
      product = Product.new(title: "Book",
                            description: "good book",
                            image_url: "ruby.png"
                            )
      product.price = -7

      assert product.invalid?
      assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')

   end

   test "products price should not be equal 0" do
      product = Product.new(title: "Book",
                            description: "good book",
                            image_url: "ruby.png"
                            )
      product.price = 0

      assert product.invalid?
      assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')

   end

   test "products price should be positive" do
      product = Product.new(title: "Book",
                            description: "good book",
                            image_url: "ruby.png"
                            )
      product.price = 100.00

      assert product.valid?
   end

   def new_prod(image_url)
      product = Product.new(title: "Book",
                            description: "good book",
                            image_url: image_url,
                            price: 120.00
                            )
   end	

   test "image_url should be valid" do
     ok = "doo.jpg do1.JPG http://adf/asas/fdfd/do2.jpg doo.gif 
     	   do1.GIF http://adf/asas/fdfd/do2.gif doo.png do1.PNG
     	   http://adf/asas/fdfd/do2.png"
     bad = "er.doc ds.ure/more wq.rtf cass.pdf"	   

     ok.split.each do |value|
       assert new_prod(value).valid?, "#{value} should be valid"
     end   

     bad.split.each do |value|
       assert new_prod(value).invalid?, "#{value} should not be valid"
     end 
   end

end
