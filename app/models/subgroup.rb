class Subgroup < ActiveRecord::Base
  belongs_to :group
  has_many :products  
  attr_accessible :describe, :name
  validates :name, :presence => true
end
