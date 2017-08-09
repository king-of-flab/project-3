class CreateRewards < ActiveRecord::Migration[5.1]
  def change
    create_table :rewards do |t|
      t.string :name
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :address
      t.string :area
      t.text :description
      t.string :image
      t.integer :opening
      t.integer :unit_time_credit
      t.bigint :created_by
      t.timestamps
    end
  end
end
