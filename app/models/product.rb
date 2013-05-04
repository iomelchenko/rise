class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title

  has_many :line_items
  
  validates :description, :image_url, :title, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_url, allow_blank: true, format: {
    with:    %r{\.(gif|jpg|png)$}i,
    message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :title, length: {:minimum => 10, message: 'min 10'}


  private

  def enshure_not_referenced_by_any_line_item

  	if line_items.empty?
  		return true
  	else
  	    errors.add(:base, "this product exist in the current cart")
  	    return false	
    end    
  	
  end

end
