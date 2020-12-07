class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [true, false]}
    validates :artist_name, presence: true
    validates :release_year, presence: true, numericality: {less_than: Time.now.year}, if: :released?
end

def released?
    released == true
end