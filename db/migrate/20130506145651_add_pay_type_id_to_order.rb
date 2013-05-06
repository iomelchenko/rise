class AddPayTypeIdToOrder < ActiveRecord::Migration
  def up
  	add_column :orders, :paytype_id, :integer
  	remove_column :orders, :pay_type
  end

    def down
  	remove_column :orders, :paytype_id
  	add_column :orders, :pay_type, :string
  end
end
