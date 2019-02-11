class Compatability < ApplicationRecord
  belongs_to :astro1, class_name: "Astro", foreign_key: "astro1_id"
  belongs_to :astro2, class_name: "Astro", foreign_key: "astro2_id"

  validates :score, presence: true
end
