class CreateJoinTableAccountReward < ActiveRecord::Migration[5.1]
  def change
    create_join_table :accounts, :rewards do |t|
      t.index [:account_id]
      t.index [:reward_id]
    end
  end
end
