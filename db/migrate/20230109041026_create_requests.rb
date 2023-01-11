class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :shop_url
      t.string :dismissal_time
      t.integer :number_of_people
      t.integer :atmosphere
      t.text :message

      t.timestamps
    end
  end
end
