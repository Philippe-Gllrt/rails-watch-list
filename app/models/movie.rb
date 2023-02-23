class Movie < ApplicationRecord
  validates :title, uniqueness: true, presence: true
  has_many :bookmarks
  validates :overview, presence: true
end
