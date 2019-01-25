class CreateShops < ActiveRecord::Migration[5.1]
	def up
		create_table :shops do |t|
    	t.string "name", :default=> '', :null=> false
    	t.integer "position"
    	


      t.timestamps
    end

    
  end



  # def change
  #   create_table :shops do |t|
  #   	t.string "Shop_Name", :default=> '', :null=> false
  #   	t.int "Shelve_number"
  #   	t.datetime "created_at"
  #   	t.datetime "updated_at"


  #     t.timestamps
  #   end
  # end

  def down
  	drop_table:shops
  end
end
