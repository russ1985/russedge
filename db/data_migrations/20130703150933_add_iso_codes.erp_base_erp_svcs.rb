# This migration comes from erp_base_erp_svcs (originally 20110609150135)
require 'yaml'

class AddIsoCodes
  
  def self.up
    #find the erp_base_erp_svcs engine
	  engine_path = Rails::Application::Railties.engines.find{|item| item.engine_name == 'erp_base_erp_svcs'}.config.root.to_s
	
	  GeoCountry.load_from_file(File.join(engine_path,'db/data_sets/geo_countries.yml'))
    GeoZone.load_from_file(File.join(engine_path,'db/data_sets/geo_zones.yml'))
  end
  
  def self.down
    GeoCountry.delete_all
    GeoZone.delete_all
  end

end
