class User < ApplicationRecord
    has_secure_password
    belongs_to :home
    has_many :colors
end
