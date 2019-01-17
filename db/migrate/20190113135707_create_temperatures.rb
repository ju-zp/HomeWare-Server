class CreateTemperatures < ActiveRecord::Migration[5.2]
  def change
    create_table :temperatures do |t|
      t.integer :interval
      t.references :board

      t.timestamps
    end
  end
end
