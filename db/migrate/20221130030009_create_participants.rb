class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants do |t|
      t.string :first_name
      t.string :last_name
      t.boolean :professional_racer
      t.integer :age
      t.belongs_to :race, foreign_key: true

      t.timestamps
    end
  end
end
