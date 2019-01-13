class Session < ApplicationRecord
  belongs_to :user
  has_many: lights
  has_many: temperature_readings
end
