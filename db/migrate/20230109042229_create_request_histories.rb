class CreateRequestHistories < ActiveRecord::Migration[6.1]
  def change
    create_table :request_histories do |t|
      t.string :phone_number

      t.timestamps
    end
  end
end
