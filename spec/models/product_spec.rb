require 'spec_helper'

describe Product do

	before(:each) do
	  @image = Rack::Test::UploadedFile.new(Rails.root.join('spec/fixtures/images/test.png'), 'image/png')
	end

	it "should be valid" do
		
      product = Product.new(title: "Product N 1",
                            description: "good product",
                            image: @image,
                            group_id: 1,
                            subgroup_id: 1,
                            price: 100.00
                            )
	    product.should be_valid

	end  

	it "should not be valid with short title" do
		
      product = Product.new(title: "Prod",
                            description: "good product",
                            image: @image,
                            group_id: 1,
                            subgroup_id: 1,
                            price: 100.00
                            )
	    product.should_not be_valid
	    product.should raise_error
	    product.errors[:title].should == ["min 6"]

	end 	

	it "should not be valid with empty title" do
		
      product = Product.new(description: "good product",
                            image: @image,
                            group_id: 1,
                            subgroup_id: 1,
                            price: 100.00
                            )
	    product.should_not be_valid
	    product.should raise_error
        product.errors[:title].should == ["can't be blank", "min 6"]	    

	end 

 	it "should not be valid with empty description" do
      product = Product.new(title: "Product N 1",
                            image: @image,
                            group_id: 1,
                            subgroup_id: 1,
                            price: 100.00
                            )
	    product.should_not be_valid
	    product.should raise_error
        product.errors[:description].should == ["can't be blank"]	    

	end 	

 	it "should not be valid with undefined group" do
      product = Product.new(title: "Product N 1",
                            description: "good product",
                            image: @image,
                            subgroup_id: 1,
                            price: 100.00
                            )
	    product.should_not be_valid
	    product.should raise_error
        product.errors[:group_id].should == ["can't be blank"]	    

	end 

 	it "should not be valid with undefined subgroup" do
      product = Product.new(title: "Product N 1",
                            description: "good product",
                            image: @image,
                            group_id: 1,
                            price: 100.00
                            )
	    product.should_not be_valid
	    product.should raise_error
        product.errors[:subgroup_id].should == ["can't be blank"]	    

	end 

 	it "price should not be negative" do
      product = Product.new(title: "Product N 1",
                            description: "good product",
                            image: @image,
                            group_id: 1,
                            subgroup_id: 1,
                            price: -1.00
                            )
	    product.should_not be_valid
        product.errors[:price].should == ["must be greater than or equal to 0.01"]
	end

end
