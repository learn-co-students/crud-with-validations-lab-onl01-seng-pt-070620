class Song < ApplicationRecord
    include ActiveModel::Validations
    validates_with FutureYearValidator
    validates_with ReleasedWithoutReleaseYear

    validates :title, presence: true, uniqueness: true
end

