class User < ApplicationRecord
  has_secure_password
  has_one_attached :avatar

  has_many :matches, foreign_key: "user1_id", dependent: :destroy
  has_many :matched, class_name: "Match", foreign_key: "user2_id", dependent: :destroy
  # has_many :compatabilities, through: :astro
  belongs_to :astro, optional: true

  before_create :assign_astrological_sign

  validates :name, presence: true
  validates :username, presence: true, uniqueness: true, format: { without: /[\s.]/ }
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^\s]*@[^\s]*\Z/ }
  validates :birthday, presence: true
  validate :validate_legal_age

  delegate :sign, :description, :traits, :element, :polarity, :color, to: :astro, prefix: true

  def to_param
    self.username
  end

  def current_birthday
    Date.parse(self.birthday.strftime('%B %d'))
  end

  def birthday_formatted
    self.birthday.strftime('%B %d, %Y')
  end

  def is_legal_age
    self.birthday && self.birthday <= 18.years.ago
  end

  def find_astrological_sign
    Astro.find { |astro| astro.user_within?(self) }
  end

  def compatibility_with(user)
    Compatability.find_by(astro1: self.astro, astro2: user.astro)
  end

  def score_with(user)
    compatibility_with(user).score
  end

  def generate_matches(min = 85)
    User.where.not(id: self.id).select do |user|
      compatibility = compatibility_with(user)
      if compatibility && compatibility.score >= min
        Match.create(user1: self, user2: user, compatability: compatibility)
      end
    end
  end

  def matched_users
    self.matches.map(&:user)
  end

  def sorted_matches
    self.matches.joins(:compatability).order('score DESC')
  end

  def avatar_url
    if self.avatar.attached?
      self.avatar.variant(resize: "200x200!")
    else
      return "default-avatar-200.png"
    end
  end

  private 

  def validate_legal_age
    if !self.is_legal_age
      legal_date = 18.years.ago.strftime('%B %d, %Y')
      errors.add(:birthday, "must be on or after #{legal_date}")
    end
  end

  def assign_astrological_sign
    self.astro = find_astrological_sign
  end
end
