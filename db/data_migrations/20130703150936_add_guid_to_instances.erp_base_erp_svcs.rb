# This migration comes from erp_base_erp_svcs (originally 20130404201756)
class AddGuidToInstances
  
  def self.up
    CompassAeInstance.all.each do |instance|
      instance.setup_guid
    end
  end

end
