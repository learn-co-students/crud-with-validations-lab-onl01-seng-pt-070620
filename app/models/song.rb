class Song < ApplicationRecord
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [ true, false ]}
    validates :release_year, presence: true, if: :released?
    validate :date_impossible

    def released?
        released == true
    end 

    def date_impossible
        if release_year.present? && release_year > Date.current.year
            errors.add(:release_year, "song can not be released in the future")
        end 
    end 

end
