class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  # Process uploaded image before saving
  def process_icon_data
    return unless icon_data.present?

    # Create a new ActiveStorage blob and attach it to this record
    file = StringIO.new(icon_data.read)
    checksum = Digest::SHA256.hexdigest(file.read)
    file.rewind
    self.icon_attachment = ActiveStorage::Blob.create_before_direct_upload!(
      key: SecureRandom.hex,
      filename: 'icon.jpg',
      byte_size: file.size,
      checksum:,
      content_type: 'image/jpeg'
    ).tap { |blob| blob.upload(file) }
  end
end
