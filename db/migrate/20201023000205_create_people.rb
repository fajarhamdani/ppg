class CreatePeople < ActiveRecord::Migration[6.0]
  def change
    create_table :people do |t|
      t.string :fullname
      t.string :nickname
      t.date :date_of_birth
      t.string :place_of_birth
      t.integer :sex
      t.string :blood_type
      t.string :status
      t.integer :kelompok_id

      t.index :kelompok_id

      t.timestamps
    end
  end
end
