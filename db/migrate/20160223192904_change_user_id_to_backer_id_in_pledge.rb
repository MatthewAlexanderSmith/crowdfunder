class ChangeUserIdToBackerIdInPledge < ActiveRecord::Migration
  def change
    rename_column :pledges, :user_id, :backer_id
  end
end
