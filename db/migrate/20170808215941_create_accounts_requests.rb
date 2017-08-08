class CreateAccountsRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :accounts_requests do |t|
      t.references :account, foreign_key: true
      t.references :request, foreign_key: true

      t.timestamps
    end
  end
end
