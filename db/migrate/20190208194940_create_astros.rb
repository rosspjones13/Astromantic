class CreateAstros < ActiveRecord::Migration[5.2]
  def change
    create_table :astros do |t|
      t.string :sign
      t.string :date_start
      t.string :date_end

      t.timestamps
    end
  end
end
