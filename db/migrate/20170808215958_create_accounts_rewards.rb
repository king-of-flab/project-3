class CreateAccountsRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts_rewards do |t|
      t.references :account, foreign_key: true
      t.references :reward, foreign_key: true

      t.timestamps
    end
  end
end
