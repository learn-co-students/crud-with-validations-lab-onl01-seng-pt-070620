class Song < ApplicationRecord
    validates :title, presence: true
    validates :artist_name, presence: true
    validate :repeated_title?
    validates :release_year, presence: true,
        if: :released?
    validate :valid_release_year?

    def repeated_title?
        if Song.any? {|s| s.title == title && s.artist_name == artist_name && s.release_year == release_year}
            errors.add(:title, "Cannot add a duplicate song")
        end
    end

    def valid_release_year?
        if release_year.present? && release_year > Date.today.year
            errors.add(:release_year, "The release year can't be in the future!")
        end
    end
end


