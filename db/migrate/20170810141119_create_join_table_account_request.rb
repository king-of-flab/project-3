class CreateJoinTableAccountRequest < ActiveRecord::Migration[5.1]
  def change
    create_join_table :accounts, :requests do |t|
      t.index [:account_id]
      t.index [:request_id]
    end
  end
end
