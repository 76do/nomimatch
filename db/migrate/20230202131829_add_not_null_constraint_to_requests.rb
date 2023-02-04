class AddNotNullConstraintToRequests < ActiveRecord::Migration[6.1]
  def change
    change_column_null :requests, :sender_name, false
  end
end
