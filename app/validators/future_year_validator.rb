class FutureYearValidator < ActiveModel::Validator 
    def validate(record)
        if record.release_year.to_i > 2020
            record.errors[:release_year] << "That's a future date, you fool!"
        end
    end
end