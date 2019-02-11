class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.datetime :birthday
      t.string :photo_filename
      t.string :email
      t.string :username
      t.belongs_to :astro, foreign_key: true

      t.timestamps
    end
  end
end
