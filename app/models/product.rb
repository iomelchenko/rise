# -*- encoding : utf-8 -*-
class Product < ActiveRecord::Base

  attr_accessible :description, :price, :title, :image, :group_id, :subgroup_id

  has_many :line_items
  has_many :orders, through: :line_items
  belongs_to :group
  belongs_to :subgroup
  has_many :subcode_prods, dependent: :destroy

  #before destroy  :enshure_not_referenced_by_any_line_item

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

  scope :cosm_11, joins(:group).joins(:subgroup).where("subgroups.name" => "Помады").order(:title)
  scope :cosm_12, joins(:group).joins(:subgroup).where("subgroups.name" => "Тушь").order(:title)
  scope :cosm_13, joins(:group).joins(:subgroup).where("subgroups.name" => "Тени").order(:title)
  scope :cosm_14, joins(:group).joins(:subgroup).where("subgroups.name" => "Лаки").order(:title)

  scope :lingerie_11, joins(:group).joins(:subgroup).where("subgroups.name" => "Нижнее белье").order(:title)
  scope :lingerie_12, joins(:group).joins(:subgroup).where("subgroups.name" => "Бюстгальтеры").order(:title)
  scope :lingerie_13, joins(:group).joins(:subgroup).where("subgroups.name" => "Трусы").order(:title)    
  
  scope :parfum_11, joins(:group).joins(:subgroup).where("subgroups.name" => "Мужская").order(:title)
  scope :parfum_12, joins(:group).joins(:subgroup).where("subgroups.name" => "Женская").order(:title)
  scope :parfum_13, joins(:group).joins(:subgroup).where("subgroups.name" => "Кремы").order(:title)

  scope :toys_11, joins(:group).joins(:subgroup).where("subgroups.name" => "до 1-го года").order(:title)
  scope :toys_12, joins(:group).joins(:subgroup).where("subgroups.name" => "от 1-го до 3-х лет").order(:title)
  scope :toys_13, joins(:group).joins(:subgroup).where("subgroups.name" => "от 3-х до 5-ти лет").order(:title)
  scope :toys_14, joins(:group).joins(:subgroup).where("subgroups.name" => "от 5-ти лет и старше").order(:title)

  
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
