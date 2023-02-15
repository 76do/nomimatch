class AddActiveColumnToApiKeys < ActiveRecord::Migration[6.1]
  def change
    add_column :api_keys, :active, :boolean
  end
end
