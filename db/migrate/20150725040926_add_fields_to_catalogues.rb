class AddFieldsToCatalogues < ActiveRecord::Migration
  def change
    add_column :catalogues, :url, :string
    add_column :catalogues, :email, :string
  end
end
