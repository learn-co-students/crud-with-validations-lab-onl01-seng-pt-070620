class Song < ApplicationRecord
    validates :title, presence:true 
    validate :title, :title_cannot_be_same_artist_same_year
    # validates :released, presence:true 
    validate :release_year, :release_year_addl_validations
    validates :artist_name, presence:true
    
    def title_cannot_be_same_artist_same_year
        title = self.title
        artist_name = self.artist_name
        year = self.release_year
        Song.all.each do |song|
            if song.title == title && song.release_year == year && song.artist_name == artist_name
                errors.add(:title, "cannot have a title by the same artist in the same year")
            end
        end
    end

    def release_year_addl_validations
        current_date = Date.current
        current_year = current_date.year
        # binding.pry
        if self.release_year? && self.release_year > current_year
            errors.add(:release_year, "release year must be less than or equal to current year if song has been released")
        end
        if self.released == true  && self.release_year? #has been released and year present and not nil
            #test to ensure less than or equal to current year
            if self.release_year <= current_year
                valid_flag = true
            end
        else
            # binding.pry
            if self.released == true #it has been released but there is no year 
                # binding.pry
                errors.add(:release_year, "release year must be less than or equal to current year if song has been released")
            end
        end
    end
      
end
