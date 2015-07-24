class Catalogue < ActiveRecord::Base
  has_attached_file :pdf
  validates_attachment_content_type :pdf, :content_type => /application\/pdf/

  def first_image_url
    "#{pdf.url(:original, timestamp: false)}_0.jpg"
  end

  def remaining_image_urls
    (1...image_count).map {|i| "#{pdf.url(:original, timestamp: false)}_#{i}.jpg"}
  end
end
