class CreateOrganisations < ActiveRecord::Migration[5.1]
  def change
    create_table :organisations do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :uen
      t.string :profile_img
      t.integer :tel
      t.integer :time_credit
      
      t.timestamps
    end
  end
end
