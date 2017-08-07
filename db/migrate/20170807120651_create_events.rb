class CreateEvents < ActiveRecord::Migration[5.1]
  def change
    create_table :events do |t|
      t.string :type
      t.string :name
      t.date :date
      t.time :start_time
      t.time :end_time
      t.string :address
      t.string :area
      t.string :img
      t.text :description
      t.integer :pax_required
      t.integer :pax_registered
      t.integer :unit_time_credit
      t.string :created_by
      t.string :status
      
      t.timestamps
    end
  end
end
