# -*- encoding : utf-8 -*-
class Subgroup < ActiveRecord::Base
  belongs_to :group
  has_many :products
  has_many :line_items    
  attr_accessible :describe, :name
  validates :name, presence: true, uniqueness: true

end
