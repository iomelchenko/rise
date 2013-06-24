# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation

  validates :name, presence: true, uniqueness: true
  validates :password, :length => { :in => 6..20 }
  has_secure_password
  after_destroy :ensure_an_admin_remains

  private

    def ensure_an_admin_remains
        if User.count.zero?
           raise "The last user can't be deleted"
        end	
    end	
end
