class CreateVisits < ActiveRecord::Migration
  def up
    create_table :visits do |t|
      t.integer :patient_id, null: false
      t.integer :doctor_id, null: false
      t.text :diagnosis, null: false

      t.timestamps
    end
    add_index :visits, :patient_id
    add_index :visits, :doctor_id
    add_foreign_key :visits, :patients
    add_foreign_key :visits, :doctors
  end

  def down
    drop_table :visits
  end
end
