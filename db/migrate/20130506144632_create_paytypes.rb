# -*- encoding : utf-8 -*-
class CreatePaytypes < ActiveRecord::Migration
  def change
    create_table :paytypes do |t|
      t.string :pay_type

      t.timestamps
    end
  end
end
