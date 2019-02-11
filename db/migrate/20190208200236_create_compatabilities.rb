class CreateCompatabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :compatabilities do |t|
      t.integer :score
      t.belongs_to :sign1, foreign_key: true
      t.belongs_to :sign2, foreign_key: true

      t.timestamps
    end
  end
end
