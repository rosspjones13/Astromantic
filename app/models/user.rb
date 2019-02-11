class User < ApplicationRecord
  has_many :matches, foreign_key: "user1_id", dependent: :destroy
  has_many :matched, class_name: "Match", foreign_key: "user2_id", dependent: :destroy
  belongs_to :astro, optional: true

  after_create :assign_astrological_sign

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true, format: { without: /\s/ }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^\s]*@[^\s]*\Z/ }
  validates :birthday, presence: true
  validate :is_legal_age

  delegate :sign, :description, :traits, :element, :polarity, :color, to: :astro, prefix: true

  def current_birthday
    Date.parse(self.birthday.strftime('%B %d'))
  end

  def birthday_formatted
    self.birthday.strftime('%B %d, %Y')
  end

  def color_class
    self.astro_color.downcase.gsub(/[_ ]/,'-')
  end

  def polarity_class
    self.astro_polarity.downcase
  end

  private 

  def is_legal_age
    self.birthday <= 18.years.ago
  end

  def find_astrological_sign
    Astro.find { |astro| astro.user_within?(self) }
  end

  def assign_astrological_sign
    self.astro = find_astrological_sign
  end
end
