class CreateUsers < ActiveRecord::Migration[5.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :nric
      t.string :nric_img
      t.string :profile_img
      t.integer :tel
      t.integer :time_credit
      t.boolean :admin
      
      t.timestamps
    end
  end
end
