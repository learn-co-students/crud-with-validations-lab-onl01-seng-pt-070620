class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [true, false]}
    validates :title, uniqueness: { scope: :release_year }

    validates :release_year, presence: true, numericality: {less_than: Time.now.year}, if: :released?
 
    def released?
      released == true
    end
end
