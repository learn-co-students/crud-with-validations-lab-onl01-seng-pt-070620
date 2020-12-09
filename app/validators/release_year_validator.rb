class ReleaseYearValidator < ActiveModel::Validator 
    def validate(record)
        unless record.released == true 

       
    end
end 