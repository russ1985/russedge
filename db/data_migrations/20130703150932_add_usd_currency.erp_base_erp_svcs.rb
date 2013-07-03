# This migration comes from erp_base_erp_svcs (originally 20110525001935)
class AddUsdCurrency
  
  def self.up
    Currency.create(:name => 'US Dollar', :internal_identifier => 'USD', :major_unit_symbol => "$")
  end
  
  def self.down
    Currency.usd.destroy
  end

end
