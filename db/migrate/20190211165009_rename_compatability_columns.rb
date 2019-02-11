class RenameCompatabilityColumns < ActiveRecord::Migration[5.2]
  def change
    rename_column :compatabilities, :sign1_id, :astro1_id
    rename_column :compatabilities, :sign2_id, :astro2_id
  end
end
