class CreateCatalogues < ActiveRecord::Migration
  def change
    create_table :catalogues do |t|
      t.integer :image_count
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
