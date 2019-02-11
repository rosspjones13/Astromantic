class Match < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.references :user1
      t.references :user2
      t.references :match

      t.timestamps
    end
  end
end
