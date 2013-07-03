# This migration comes from erp_app (originally 20120920145259)
class AddJobTracker < ActiveRecord::Migration
  def up
    unless table_exists?(:job_trackers)
      create_table :job_trackers do |t|
        t.string :job_name
        t.string :job_klass
        t.string :run_time
        t.datetime :last_run_at
        t.datetime :next_run_at
      end
    end
  end

  def down
    if table_exists?(:job_trackers)
      drop_table :job_trackers
    end
  end
end
