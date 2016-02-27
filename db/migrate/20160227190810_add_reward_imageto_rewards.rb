class AddRewardImagetoRewards < ActiveRecord::Migration
  def change
    add_column :rewards, :reward_image, :string
  end
end
