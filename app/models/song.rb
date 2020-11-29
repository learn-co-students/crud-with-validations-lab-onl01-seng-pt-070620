class Song < ApplicationRecord

    validates :release_year, presence: true, if: :released?, :numericality => { :less_than_or_equal_to => 2020 }
    
    validates :title, presence: true, uniqueness: true
 
    validates :artist_name, presence: true
 
end
