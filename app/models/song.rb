class Song < ApplicationRecord
    validate :no_repeat
    validates :title, presence: true
    validates :artist_name, presence: true
    validates :release_year, presence: true, 
        if: :released?
    validate :invalid_date

    def no_repeat
        if Song.any? {|song| song.title == title && song.artist_name == artist_name && song.release_year == release_year}
            errors.add(:title, "Can't add the same song twice in one year")
        end
    end

    def invalid_date
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "Release date cannot be in the future")
        end
    end
end
