class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|

    	t.integer :user_id
    	t.string :photo_id
    	t.string :shop_name
    	t.text :caption
    	t.text :address

      	t.timestamps
    end
  end
end
