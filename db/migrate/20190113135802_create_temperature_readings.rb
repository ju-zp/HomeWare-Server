class CreateTemperatureReadings < ActiveRecord::Migration[5.2]
  def change
    create_table :temperature_readings do |t|
      t.references :temperature
      t.integer :reading

      t.timestamps
    end
  end
end
