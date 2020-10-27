class Song < ApplicationRecord
    validates :title, presence: true
    validates :released, inclusion: { in: [true, false]}

    validates :title, uniqueness: { scope: [:artist_name, :release_year] }
    validates :artist_name, presence: true

    with_options if: :song_released? do |song|
        song.validates :release_year, presence: true
        song.validates :release_year, numericality: {
          less_than_or_equal_to: Date.today.year
        }
      end
    
      def song_released?
        released
      end

end
