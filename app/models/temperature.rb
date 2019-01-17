class Temperature < ApplicationRecord
    has_many :temperature_readings
    belongs_to :board
end
