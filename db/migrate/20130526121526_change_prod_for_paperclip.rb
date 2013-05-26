class ChangeProdForPaperclip < ActiveRecord::Migration
  def up
	change_table :products do |t|
	  t.string :image_content_type
	  t.integer :image_file_size
	  t.datetime :image_updated_at
	  t.rename :image_url, :image_file_name
	end
  end

  def down
	change_table :products do |t|
	  t.remove :image_content_type
	  t.remove :image_file_size
	  t.remove :image_updated_at
	  t.rename :image_file_name, :image_url
	end  	
  end
end

