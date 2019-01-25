class CreateCandies < ActiveRecord::Migration[5.1]
  def up
    create_table :candies do |t|
    	t.string "name", :default=> '', :null=> false
      t.integer "shop_id"
      t.integer "position"
      t.integer "shelf_id"
    	t.boolean "visible", :default =>true
      t.timestamps
    end 
     add_index("candies", "shop_id")
     add_index("candies", "shelf_id")
  end



  def down
    drop_table:candies
  end
end
