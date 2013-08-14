class AddSubcodeToLineItems < ActiveRecord::Migration
  def change
    add_column :line_items, :subcode_prods_id, :integer
  end
end
