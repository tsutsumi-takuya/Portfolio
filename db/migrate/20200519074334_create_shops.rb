class CreateShops < ActiveRecord::Migration[5.2]
  def change
    create_table :shops do |t|

    	t.integer :user_id
    	t.string :photo_id
    	t.text :caption
    	t.text :address

      	t.timestamps
    end
  end
end
