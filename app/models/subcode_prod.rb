class SubcodeProd < ActiveRecord::Base

  attr_accessible :subcode

  belongs_to :product
  has_many :line_items  

  validates :subcode, presence: true  

  scope :subcodeexist, ->(product_id) { where(product_id: product_id) }

end
