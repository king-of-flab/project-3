class CreateEventsOrganisations < ActiveRecord::Migration[5.1]
  def change
    create_table :events_organisations do |t|
      t.references :event, foreign_key: true
      t.references :organisation, foreign_key: true

      t.timestamps
    end
  end
end
