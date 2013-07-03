# This migration comes from erp_app (originally 20111108183740)
class AddNewContactWidgets
  
  def self.up
    crm_app = OrganizerApplication.find_by_internal_identifier('crm')
     
    unless crm_app.nil?
      Widget.find_by_internal_identifier('party_contact_management').destroy

      phone_number_managementt_widget = ::Widget.create(     
        :description => 'Phone Number Management',
        :icon => 'icon-grid',     
        :xtype => 'phonenumbergrid',
        :internal_identifier => 'phone_number_management'
      )

      email_address_management_widget = ::Widget.create(
        :description => 'Email Address Management',
        :icon => 'icon-grid',
        :xtype => 'emailaddressgrid',
        :internal_identifier => 'email_address_management'
      )

      postal_address_management_widget = ::Widget.create(
        :description => 'Postal Address Management',
        :icon => 'icon-grid',
        :xtype => 'postaladdressgrid',
        :internal_identifier => 'postal_address_management'
      )

      crm_app.widgets << phone_number_managementt_widget
      crm_app.widgets << email_address_management_widget
      crm_app.widgets << postal_address_management_widget
      crm_app.save

    end
  end
  
  def self.down
  end

end
