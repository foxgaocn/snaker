class AddAttachmentPdfToCatalogues < ActiveRecord::Migration
  def self.up
    change_table :catalogues do |t|
      t.attachment :pdf
    end
  end

  def self.down
    remove_attachment :catalogues, :pdf
  end
end
