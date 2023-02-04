class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :sender_name
      t.string :shop_url
      t.integer :dismissal_time
      t.integer :number_of_people
      t.integer :budget
      t.integer :atmosphere
      t.text :message
      t.timestamps
    end
  end
end
