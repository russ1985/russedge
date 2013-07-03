# This migration comes from erp_app (originally 20130411200351)
class AddJobTrackerMobileApp

  def self.up
    MobileApplication.create(
        :description => 'Jobs',
        :icon => 'icon-tasks',
        :internal_identifier => 'job_tracker',
        :xtype => 'compass-erpapp-mobile-jobtracker-application'
    )
  end

  def self.down
    MobileApplication.destroy_all("internal_identifier = 'job_tracker'")
  end

end
