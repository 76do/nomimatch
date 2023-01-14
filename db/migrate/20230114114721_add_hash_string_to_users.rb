class AddHashStringToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :random_id, :string
  end
end
