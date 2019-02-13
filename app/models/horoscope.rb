class Horoscope
  def self.get_horoscope(sign, day = "today")
    page = Nokogiri::HTML(open("https://new.theastrologer.com/#{sign.to_s.downcase}"))
    selector = "##{day.to_s} > p:first-of-type"
    elem = page.css(selector)
    elem.text if elem.any?
  end
end