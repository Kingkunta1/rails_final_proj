class AddStoreIdToBrands < ActiveRecord::Migration[6.0]
  def change
    add_column :brands, :store_id, :integer
  end
end
