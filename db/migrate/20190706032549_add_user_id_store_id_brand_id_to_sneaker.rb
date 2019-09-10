class AddUserIdStoreIdBrandIdToSneaker < ActiveRecord::Migration[6.0]
  def change
    add_column :sneakers, :user_id, :integer
    add_column :sneakers, :brand_id, :integer
    add_column :sneakers, :store_id, :integer
  end
end
