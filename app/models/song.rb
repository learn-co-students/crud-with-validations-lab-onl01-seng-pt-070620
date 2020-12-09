class Song < ApplicationRecord
    validates :released, inclusion: [true, false]
    validates :title, presence: true
    validates :title, uniqueness: true
    validates :artist_name, presence: true 

    validates :release_year, numericality: { less_than_or_equal_to: Time.now.year }, if: :released?
    validates :release_year, presence: true, if: :released?


    current_year = Time.now.year


    # check if released is true


    
    # is invalid wo release year when released is true 
    # is invalid when the relese year is in the future 
    # is invaliad if an artist tries to release the same song 
    # twice in a year 
end
