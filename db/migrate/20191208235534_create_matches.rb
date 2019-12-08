class CreateMatches < ActiveRecord::Migration[5.1]
  def change
    create_table :matches do |t|
      t.integer :seller
      t.integer :buyer
      t.string :dining_hall
      t.integer :price
      t.datetime :meeting_time

      t.timestamps
    end
  end
end
