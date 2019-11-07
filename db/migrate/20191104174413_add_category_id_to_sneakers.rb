class AddCategoryIdToSneakers < ActiveRecord::Migration[6.0]
  def change
    add_column :sneakers, :category_id, :integer
  end
end
