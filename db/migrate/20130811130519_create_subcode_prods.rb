class CreateSubcodeProds < ActiveRecord::Migration
  def change
    create_table :subcode_prods do |t|
      t.string :subcode
      t.references :product

      t.timestamps
    end
    add_index :subcode_prods, :product_id
  end
end
