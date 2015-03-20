class CreateDoctors < ActiveRecord::Migration
  def up
    create_table :doctors do |t|
      t.integer :clinic_id, null: false
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :patronymic
      t.timestamp :dob
      t.string :email
      t.string :phone
      t.string :address

      t.datetime :deleted_at
      t.timestamps
    end
    add_index :doctors, :first_name
    add_index :doctors, :last_name
    add_index :doctors, :email
    add_index :doctors, :phone
    add_index :doctors, :deleted_at
  end

  def down
    drop_table :doctors
  end
end
