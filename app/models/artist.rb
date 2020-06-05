class Artist < ApplicationRecord
    has_many :availability
    has_secure_password
    validates: name, uniqueness: { case_sensitive: false}
end
