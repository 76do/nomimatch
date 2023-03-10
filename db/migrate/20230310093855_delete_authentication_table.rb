class DeleteAuthenticationTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :authentications
  end
end
