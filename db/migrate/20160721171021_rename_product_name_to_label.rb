class RenameProductNameToLabel < ActiveRecord::Migration[5.0]
  def change
    rename_column :products, :name, :label
  end
end