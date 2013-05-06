class AddPayTypeIdToOrder < ActiveRecord::Migration
  def up
  	add_column :orders, :pay_type_id, :integer
  	remove_column :orders, :pay_type
  end

    def down
  	remove_column :orders, :pay_type_id
  	add_column :orders, :pay_type, :string
  end
end
