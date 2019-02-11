class CreateAstros < ActiveRecord::Migration[5.2]
  def change
    create_table :astros do |t|
      t.string :sign
      t.string :character
      t.string :traits
      t.string :date_start
      t.string :date_end
      t.string :color
      t.string :element
      t.string :polarity
      t.text :description

      t.timestamps
    end
  end
end
