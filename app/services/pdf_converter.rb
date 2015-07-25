require 'rmagick'

class PdfConverter
  def self.convert(catalogue_id)
    catalogue = Catalogue.find catalogue_id
    dirname = File.dirname(catalogue.pdf.path)
    basename = File.basename(catalogue.pdf.path)
    pdf = Magick::ImageList.new(catalogue.pdf.path) do
      self.quality = 80
      self.density = 144
    end.each_with_index do |page_img, i|
      page_img.write File.join(dirname, "#{basename}_#{i}.jpg")
    end
    catalogue.update_attribute(:image_count, pdf.count)
  end
end