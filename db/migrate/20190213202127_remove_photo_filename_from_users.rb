class RemovePhotoFilenameFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :photo_filename
  end
end
