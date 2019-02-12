class RenameMatchIdColumn < ActiveRecord::Migration[5.2]
  def change
    rename_column :matches, :match_id, :compatability_id
  end
end
