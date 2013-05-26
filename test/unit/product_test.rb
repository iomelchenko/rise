require 'test_helper'

class ProductTest < ActiveSupport::TestCase
   fixtures :products

   test "products attributes must not be empty" do
      product = Product.new
      assert product.invalid?
      assert product.errors[:title].any?
      assert product.errors[:description].any?
      assert product.errors[:price].any?
      #assert product.errors[:image].any?

   end

   test "products price should not be negative" do
      product = Product.new(title: "BookBookBook",
                            description: "good book",
                            image_file_name: "ruby.png",
                            image_content_type: 'image/png',
                            image_file_size: 6646
                            )
      product.price = -7

      assert product.invalid?
      assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')

   end

   test "products price should not be equal 0" do
      product = Product.new(title: "BookBookBook",
                            description: "good book",
                            image: "ruby.png"
                            )
      product.price = 0

      assert product.invalid?
      assert_equal "must be greater than or equal to 0.01", product.errors[:price].join('; ')

   end

   test "products price should be positive" do
      product = Product.new(title: "BookBookBook",
                            description: "good book",
                            image: "ruby.png"
                            )
      product.price = 100.00

      assert product.valid?
   end

   def new_prod(image)
      product = Product.new(title: "BookBookBook",
                            description: "good book",
                            image: image,
                            price: 120.00
                            )
   end	

   test "image should be valid" do
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

    test "product is not valid without unique title" do
      product = Product.new(title: products(:ruby).title,
                            description: "smart book",
                            image: "rrrr.gif",
                            price: 10.00
                            )

      assert !product.save
      assert_equal "has already been taken", product.errors[:title].join('; ')

   end

    test "product is not valid without unique title - i18n" do
      product = Product.new(title: products(:ruby).title,
                            description: "smart book",
                            image: "rrrr.gif",
                            price: 10.00
                            )

      assert !product.save
      assert_equal I18n.translate('activerecord.errors.messages.taken'), 
                                   product.errors[:title].join('; ')

   end

   test "length of title should be minimum 6 simbols" do
      product = Product.new(title: "Book",
                            description: "good book",
                            image: "ruby.png",
                            price: 10.00
                            )

      assert product.invalid?
      assert_equal "min 6", product.errors[:title].join('; ')      
   end

end
