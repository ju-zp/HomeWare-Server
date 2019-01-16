class CreateTemperatureReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :temperature_readings do |t|
      t.references :board, foreign_key: true
      t.integer :reading
      t.datetime :time

      t.timestamps
    end
  end
end
