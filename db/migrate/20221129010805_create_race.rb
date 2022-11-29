class CreateRace < ActiveRecord::Migration[5.2]
  def change
    create_table :races do |t|
      t.string :name
      t.string :location
      t.boolean :professional_racers_only
      t.integer :kilometers
      t.datetime :date

      t.timestamps
    end
  end
end
