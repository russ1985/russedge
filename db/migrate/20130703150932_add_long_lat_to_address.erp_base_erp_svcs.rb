# This migration comes from erp_base_erp_svcs (originally 20130411125210)
class AddLongLatToAddress < ActiveRecord::Migration
  def up
    unless columns(:postal_addresses).collect {|c| c.name}.include?('latitude')
      add_column :postal_addresses, :latitude, :decimal, :precision => 12, :scale => 8
      add_column :postal_addresses, :longitude, :decimal, :precision => 12, :scale => 8
    end
  end

  def down
    if columns(:postal_addresses).collect {|c| c.name}.include?('latitude')
      remove_column :postal_addresses, :latitude
      remove_column :postal_addresses, :longitude
    end
  end
end
