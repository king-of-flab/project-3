class CreateRequests < ActiveRecord::Migration[5.1]
  def change
    create_table :requests do |t|
      t.string :name
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :address
      t.string :area
      t.text :description
      t.string :image
      t.integer :opening
      t.integer :attendance, default: 0
      t.integer :unit_time_credit
      t.boolean :completed, default: false
      t.bigint :created_by
      t.timestamps
    end
  end
end
