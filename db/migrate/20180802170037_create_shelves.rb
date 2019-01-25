class CreateShelves < ActiveRecord::Migration[5.1]
  def up
    create_table :shelves do |t|
    	t.string "name", :default=> '', :null=> false
    	t.integer "position"
    	t.integer "shop_id"
    	t.string "permalink"

      t.timestamps
    end
    add_index("shelves", "shop_id")
    add_index("shelves", "permalink")
  end



  def down
  	drop_table:shelves
  end
end
