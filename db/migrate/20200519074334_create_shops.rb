class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|

    	t.integer :user_id
    	t.string :shop_id
    	t.string :shop_name
    	t.text :caption
    	t.text :address
      t.string :shop_image_id

      	t.timestamps
    end
  end
end
