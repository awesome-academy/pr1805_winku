class ImageUploader < CarrierWave::Uploader::Base
  storage :file
  include Cloudinary::CarrierWave
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end
end
