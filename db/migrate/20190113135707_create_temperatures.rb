class CreateTemperatures < ActiveRecord::Migration[5.2]
  def change
    create_table :temperatures do |t|
      t.integer :interval

      t.timestamps
    end
  end
end
