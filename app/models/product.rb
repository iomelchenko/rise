class Product < ActiveRecord::Base

  attr_accessible :description, :price, :title, :image, :group_id, :subgroup_id

  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :group
  belongs_to :subgroup

  has_attached_file :image, :styles => { :small => "150x150>" },
                    :url => "/:attachment/:id/:style/:basename.:extention",
                    :path => ":rails_root/public/:attachment/:id/:style/:basename.:extention"
  
  validates :description, :title, :group_id, :subgroup_id, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :title, uniqueness: true
  validates :image_file_name, allow_blank: true, format: {
     with:    %r{\.(gif|jpg|png)$}i,
     message: 'must be a URL for GIF, JPG or PNG image.'
  }
  validates :title, length: {:minimum => 6, message: 'min 6'}


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
