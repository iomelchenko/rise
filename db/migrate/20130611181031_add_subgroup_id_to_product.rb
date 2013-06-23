class AddSubgroupIdToProduct < ActiveRecord::Migration
  def change
    add_column :products, :subgroup_id, :integer
  end
end
