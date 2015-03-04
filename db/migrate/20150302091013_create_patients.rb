class CreatePatients < ActiveRecord::Migration
  def up
    create_table :patients do |t|
      t.integer :clinic_id
      t.string :first_name
      t.string :last_name
      t.string :patronymic
      t.timestamp :dob
      t.string :email
      t.string :phone
      t.text :diagnosis

      t.timestamps
    end

    add_index :patients, :clinic_id
    add_index :patients, :first_name
    add_index :patients, :last_name
    add_index :patients, :email, unique: true
    add_index :patients, :phone, unique: true
  end

  def down
    drop_table :patients
  end
end
