class ComedianImageUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  if Rails.env.development?
    storage :file
  elsif Rails.env.test?
    storage :file
  else
    storage :fog
  end

  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  process resize_to_limit: [350, 350]

  version :thumb do
    process resize_to_fill: [200, 200]
  end

  def default_url
    "default.png"
  end
end
