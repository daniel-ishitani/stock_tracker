class RenameLastPrice < ActiveRecord::Migration[5.2]
  def change
    rename_column :stocks, :last_price, :latest_price
  end
end
