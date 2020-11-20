class Song < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :artist_name, presence: true
    validates :released, inclusion: { in: [ true, false ] }
    validates_presence_of :release_year, :if => :released?
    validates :release_year, numericality: { less_than_or_equal_to: Date.today.year }, :if => :released?
end
