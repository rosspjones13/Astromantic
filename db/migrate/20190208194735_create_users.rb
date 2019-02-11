class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.date :birthday
      t.belongs_to :astro_id, foreign_key: true

      t.timestamps
    end
  end
end
