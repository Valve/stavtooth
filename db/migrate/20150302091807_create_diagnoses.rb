class CreateDiagnoses < ActiveRecord::Migration
  def up
    create_table :diagnoses do |t|
      t.string :name
      t.text :description
    end
    add_index :diagnoses, :name, unique: true
  end

  def down
    drop_table :diagnoses
  end
end
