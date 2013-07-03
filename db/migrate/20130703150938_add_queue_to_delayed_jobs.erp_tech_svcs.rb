# This migration comes from erp_tech_svcs (originally 20130410135419)
class AddQueueToDelayedJobs < ActiveRecord::Migration
  def up
    unless columns(:delayed_jobs).collect {|c| c.name}.include?('queue')
      add_column :delayed_jobs, :queue, :string 
    end
  end
  
  def down
    if columns(:delayed_jobs).collect {|c| c.name}.include?('queue')
      remove_column :delayed_jobs, :queue, :string 
    end
  end
end
