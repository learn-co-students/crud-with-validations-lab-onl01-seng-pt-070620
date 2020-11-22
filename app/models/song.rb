class Song < ApplicationRecord

    validates :title, presence: true
    validates :title, uniqueness: { scope: :release_year }
    validates :released, inclusion: { in: [true, false] }
    validates :release_year, presence: true, numericality: {less_than_or_equal_to: Date.today.year }, if: :released?
    validates :artist_name, presence: true


    def released?
      released == true
    end
end
