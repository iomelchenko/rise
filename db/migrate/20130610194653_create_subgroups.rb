class CreateSubgroups < ActiveRecord::Migration
  def change
    create_table :subgroups do |t|
      t.string :name
      t.text :describe
      t.references :group

      t.timestamps
    end
    add_index :subgroups, :group_id
  end
end
