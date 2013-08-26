# -*- encoding : utf-8 -*-
module ProductsHelper

  def group_subgroup_name (entity, id)
    
      if entity.find_by_id(id)
      	 entity.find_by_id(id).name
      else
         "Не определена !!!"
      end   	 
  end	

end

