class User < ApplicationRecord
  has_many :matches, foreign_key: "user1_id", dependent: :destroy
  has_many :matched, class_name: "Match", foreign_key: "user2_id", dependent: :destroy
  belongs_to :astro, optional: true

  validates :name, presence: true
  validates :username, presence: true, format: { without: /\s/ }
  validates :email, presence: true, format: { with: /\A[^\s]*@[^\s]*\Z/ }
  validates :birthday, presence: true
  validate :is_legal_age

  def is_legal_age
    self.birthday <= 18.years.ago
  end
end
