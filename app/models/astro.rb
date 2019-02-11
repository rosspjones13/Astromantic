class Astro < ApplicationRecord
  has_many :users

  validates :sign, presence: true
  validates :date_start, presence: true
  validates :date_end, presence: true
  validates :color, presence: true

  alias_attribute :name, :sign

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
