Rails.application.config.knitkit.configure do |config|
  config.unauthorized_url     = '/unauthorized'
  config.ignored_prefix_paths = ['/knitkit'] #routing filter ignore
  config.images_base_path = File.join("public")
end
Rails.application.config.knitkit.configure!