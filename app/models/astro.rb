class Astro < ApplicationRecord
  has_many :users

  validates :sign, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :color, presence: true
end
