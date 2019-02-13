class Astro < ApplicationRecord
  has_many :users
  has_many :compatabilities, class_name: "Compatability", foreign_key: "astro2_id"

  validates :sign, presence: true, uniqueness: true
  validates :date_start, presence: true, uniqueness: true
  validates :date_end, presence: true, uniqueness: true
  validates :color, presence: true

  alias_attribute :name, :sign

  def color_class
    self.color.downcase.gsub(/[_ ]/,'-')
  end

  def polarity_class
    self.polarity.downcase
  end

  def compatibility_with(astro)
    Compatability.find_by(astro1: self, astro2: astro)
  end

  def score_with(astro)
    compatibility_with(astro).score
  end

  def top_compatible_signs(min = 80)
    Astro.joins(:compatabilities).where('astro1_id = ?', self.id).where('score >= ?', min).order('score DESC')
  end

  def start_date
    Date.parse(self.date_start)
  end

  def end_date
    Date.parse(self.date_end)
  end

  def date_within?(date)
    # ensures date year is current year
    date = Date.parse(date.strftime('%b %d'))

    if self.sign == 'Capricorn'
      # capricorn spans between two years

      # is date in december?
      if date >= self.start_date
        date = date.last_year
      end

      date.between?(self.start_date.last_year, self.end_date)
    else
      date.between?(self.start_date, self.end_date)
    end
  end

  def user_within?(user)
    self.date_within?(user.birthday)
  end
end
