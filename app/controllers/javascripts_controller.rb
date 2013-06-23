class JavascriptsController < ApplicationController
def dynamic_subgroups
  @subgroups = Subgroup.find(:all)
end

end
