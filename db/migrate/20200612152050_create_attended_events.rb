class CreateAttendedEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :attended_events do |t|
      t.belongs_to :user
      t.belongs_to :event
      t.timestamps
    end
  end
end
