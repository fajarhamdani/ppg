class CreateKelompoks < ActiveRecord::Migration[6.0]
  def change
    create_table :kelompoks do |t|
      t.string :name
      t.integer :desa_id

      t.timestamps
    end
  end
end
