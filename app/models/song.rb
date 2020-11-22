class Song < ApplicationRecord 
    validates :title, presence: true
    validates :title, :uniqueness => { :scope => :release_year,
    :message => "should happen once per year" } 
    validates_presence_of :release_year, :if => :released? 

    #validates_presence_of :release_year, unless: -> { :released == false }
    #validates :release_year, presence: true, unless: -> { :released == false }
     
    
    #validates :release_year, if: -> { :release_year <= Date.today.year }
    validate  :am_i__future?  
    #validates :release_year, :exclusion => { :in => :am_i_future? 
# }
    validate :not_twice_per_year 

    def am_i__future? 
       if self.release_year 
           if self.release_year >= Date.today.year 
            errors.add(:release_year, "Should not be released in the future") 
           end
    end 
 end

    def not_twice_per_year 
        if self.release_year 
            if self 
            end
        end
    end
end