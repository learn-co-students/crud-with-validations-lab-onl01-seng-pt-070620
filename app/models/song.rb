class Song < ApplicationRecord
  validates :title, presence: true
  validates :title, uniqueness: { scope: [:release_year, :artist_name] }
  validates :released, inclusion: { in: [true, false] }
  validates :release_year, presence: true, unless: Proc.new { |song| song.released == false }
  validates :artist_name, presence: true
  validates :genre, presence: true
  validate :release_year_cannot_be_in_future, if: Proc.new { |song| song.released == true}


  private

  def release_year_cannot_be_in_future
    if release_year.present? && release_year > Date.current.year
      errors.add(:release_year, "Cannot be in the future")
    end
  end
end