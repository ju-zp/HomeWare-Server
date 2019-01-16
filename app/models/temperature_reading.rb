class TemperatureReading < ApplicationRecord
  belongs_to :board
  belongs_to :temperature
end
