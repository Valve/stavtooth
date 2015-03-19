class CreatePatients < ActiveRecord::Migration
  def up
    create_table :patients do |t|
      t.integer :clinic_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :patronymic
      t.timestamp :dob
      t.string :email
      t.string :phone
      t.string :address
      t.text :diagnosis

      t.datetime :deleted_at
      t.timestamps
    end

    add_index :patients, :clinic_id
    add_index :patients, :first_name
    add_index :patients, :last_name
    add_index :patients, :email
    add_index :patients, :phone
    add_index :patients, :deleted_at
  end

  def down
    drop_table :patients
  end
end
