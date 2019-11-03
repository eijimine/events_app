class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.string :type
      t.datetime :date
      t.integer :duration
      t.string :location
      t.text :description
      t.integer :max_participants

      t.timestamps
    end
  end
end
