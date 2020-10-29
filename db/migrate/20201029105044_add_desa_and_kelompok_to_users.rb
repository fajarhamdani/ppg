class AddDesaAndKelompokToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :desa_id, :integer
    add_column :users, :kelompok_id, :integer
  end
end
