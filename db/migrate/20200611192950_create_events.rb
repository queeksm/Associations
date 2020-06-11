class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :location
      t.date :date

      t.timestamps
    end

    add_column :events, :creator_id, :integer
  end
end
