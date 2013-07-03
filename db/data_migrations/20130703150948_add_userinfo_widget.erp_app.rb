# This migration comes from erp_app (originally 20120229160222)
class AddUserinfoWidget
  
  def self.up
    #insert data here
    if Widget.find_by_internal_identifier('userinfo').nil?
      app = Application.find_by_internal_identifier('crm')

      user = Widget.create(
        :description => 'User Info',
        :internal_identifier => 'userinfo',
        :icon => 'icon-user',
        :xtype => 'userinfo'
      )
     
      unless app.nil?
        app.widgets << user
        app.save
      end

    end
  end
  
  def self.down
    #remove data here
    Widget.find_by_internal_identifier('userinfo').destroy
  end

end
