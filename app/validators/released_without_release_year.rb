class ReleasedWithoutReleaseYear < ActiveModel::Validator 
    def validate(record)
        if (record.released === true && record.release_year.nil?)
            record.errors[:released] << "Song has no release date!"
        end
    end
end