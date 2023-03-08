class DropRequestHistories < ActiveRecord::Migration[6.1]
  def change
    drop_table :request_histories do |t|
      t.string "phone_number"
      
      t.timestamps
    end
  end
end
