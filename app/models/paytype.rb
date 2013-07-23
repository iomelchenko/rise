# -*- encoding : utf-8 -*-
class Paytype < ActiveRecord::Base
  attr_accessible :pay_type
  has_many :orders
  validates :pay_type, :presence => true
end
