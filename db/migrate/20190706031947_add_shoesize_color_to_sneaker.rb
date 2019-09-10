class AddShoesizeColorToSneaker < ActiveRecord::Migration[6.0]
  def change
    add_column :sneakers, :shoesize, :integer
    add_column :sneakers, :color, :string
  end
end
