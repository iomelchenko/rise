# -*- encoding : utf-8 -*-
class Group < ActiveRecord::Base
  has_many :subgroups
  has_many :products
  attr_accessible :discribe, :name
  validates :name, :presence => true
end
