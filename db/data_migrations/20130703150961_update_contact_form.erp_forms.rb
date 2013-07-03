# This migration comes from erp_forms (originally 20121026191738)
class UpdateContactForm
  
  def self.up
    model = DynamicFormModel.find_by_model_name('WebsiteInquiry')
    model.create_role

    fields = []

    fields << DynamicFormField.textfield({:fieldLabel => 'First Name', :name => 'first_name', :width => 250, :allowBlank => false })
    fields << DynamicFormField.textfield({:fieldLabel => 'Last Name', :name => 'last_name', :width => 250, :allowBlank => false })
    fields << DynamicFormField.email({:fieldLabel => 'Email', :name => 'email', :width => 250, :allowBlank => false })
    fields << DynamicFormField.textarea({:fieldLabel => 'Message', :name => 'message', :width => 400, :height => 200, :allowBlank => false })    
    
    d = DynamicForm.find_by_internal_identifier('contact_us')
    unless d.nil?
      d.definition = fields.to_json
      d.msg_target = 'qtip'
      d.save    
    end    
  end
  
  def self.down
    #remove data here
  end

end
