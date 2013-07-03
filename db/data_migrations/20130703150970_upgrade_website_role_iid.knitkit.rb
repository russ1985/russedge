# This migration comes from knitkit (originally 20121129185611)
class UpgradeWebsiteRoleIid
  
  def self.up
    #insert data here
    Website.all.each do |w|
      old_role_iid = "website_#{w.name.underscore.gsub("'","").gsub(",","")}_access"

      r = SecurityRole.find_by_internal_identifier(old_role_iid)
      unless r.nil?
        r.internal_identifier = w.website_role_iid
        r.save
      end      
    end
  end
  
  def self.down
    #remove data here
  end

end
