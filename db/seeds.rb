# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

signs = [
  {sign: "Aries", character: "Ram", traits: "Ambitious, Independent, Impatient", date_start: "3/21", date_end: "4/19", color: "red", element: "Fire", polarity: "Positive", description: "The first sign of the Zodiac, Aries are the trailblazers. Passionate and independent, Aries will never do something just because everyone else is doing it—a Ram needs to be 100 percent committed to the task at hand. Competitive to the max, the best way to motivate an Aries is to turn something into a contest. Aries will put everything they have (and then some) into winning. Loyal, smart, and impulsive, they always have multiple projects on their mind, and won't be satisfied until their work, social life, and personal lives line up exactly with the dream life they've envisioned. Those who are drawn to magnetic Aries may have trouble keeping up—but if they can, they'll have a friend for life."},

  {sign: "Taurus", character: "Bull", traits: "Dependable, Musical, Practical", date_start: "4/20", date_end: "5/20", color: "pink", element: "Earth", polarity: "Negative", description: "Smart, ambitious, and trustworthy, Taurus is the anchor of the Zodiac. Amazing friends, colleagues, and partners, Taureans value honesty above all else and are proud that their personal relationships tend to be drama free. Bulls get the reputation of being stubborn, but they're not always stuck in their ways. This searching sign is willing to see another point of view, but they won't flip-flop on an opinion just to make someone else happy. They will shift their thinking only if they truly have a change of heart."},

  {sign: "Gemini", character: "Twins", traits: "Curious, Affectionate, Kind", date_start: "5/21", date_end: "6/20", color: "yellow", element: "Air", polarity: "Positive", description: "Smart, passionate, and dynamic, Gemini is characterized by the Twins, Castor and Pollux, and is known for having two different sides they can display to the world. Expert communicators, Gemini is the chameleon of the Zodiac, adept at blending into different groups based on the vibe and energy they perceive. While they're also amazing at showcasing surface traits, the Gemini well runs deep, which is why the Twins are one of the Zodiac's most emotionally intelligent signs."},

  {sign: "Cancer", character: "Crab", traits: "Intuitive, Emotional, Intelligent, Passionate", date_start: "6/21", date_end: "7/22", color: "violet", element: "Water", polarity: "Negative", description: "Emotional, intuitive, and practically psychic; ruled by the moon and characterized by the crab, Cancer has so much going on in its watery depths. Cancers may seem prickly and standoffish at first meeting, once they make the decision to become friends with someone, that person has a friend for life."},

  {sign: "Leo", character: "Lion", traits: "Proud, Bold, Ambitious", date_start: "7/23", date_end: "8/22", color: "gold", element: "Fire", polarity: "Positive", description: "Bold, intelligent, warm, and courageous, fire sign Leo is a natural leader of the Zodiac, ready to blaze a trail, vanquish injustice, and make a name for themselves along the way. Blessed with high self-esteem, Lions know that they possess enviable traits—and they're proud of them. They don't believe in false modesty and will be the first to praise themselves for a job well done. But Leo isn't self-aggrandizing or unwilling to roll up those sleeves and do the work: this sign knows that in order to be respected and admired, he or she needs to put in the effort worthy of a leader."},

  {sign: "Virgo", character: "Virgin", traits: "Graceful, Organized, Kind", date_start: "8/23", date_end: "9/22", color: "silver", element: "Earth", polarity: "Negative", description: "Smart, sophisticated, and kind, Virgo gets the job done without complaining. Virgos are amazing friends, always there to lend a hand and also lend advice. Practical Virgos are incredibly adept at big picture thinking, and planning out their life, their vacations, and what they're going to do today isn't a drag it makes them feel in control and secure."},

  {sign: "Libra", character: "Scales", traits: "Diplomatic, Artistic, Intelligent", date_start: "9/23", date_end: "10/22", color: "blue", element: "Air", polarity: "Positive", description: "Intelligent, kind, and always willing to put others before themselves, Libras value harmony in all forms. Ruled by Venus, the planet of beauty, Libra adores a life that looks good. As the master of compromise and diplomacy, Libra is adept at seeing all points of view, and excels at crafting compromises and effecting mediation between others. This sign has a rich inner life yet loves other people, and they're always happiest with a large group of friends, family, and coworkers on whom they can count."},

  {sign: "Scorpio", character: "Scorpion", traits: "Seductive, Passionate, Independent", date_start: "10/23", date_end: "11/21", color: "black", element: "Water", polarity: "Negative", description: "Passionate, independent, and unafraid to blaze their own trail no matter what others think, Scorpios make a statement wherever they go. They love debates, aren't afraid of controversy, and won't back down from a debate. They also hate people who aren't genuine, and are all about being authentic—even if authentic isn't pretty."},

  {sign: "Sagittarius", character: "Archer", traits: "Adventurous, Creative, Strong Willed", date_start: "11/22", date_end: "12/21", color: "light blue", element: "Fire", polarity: "Positive", description: "Independent and strong-willed, Sagittarius personalities are all about going off the beaten path. Sagittarius isn’t afraid to step away from the pack, and is a natural born leader who goes after what he or she wants, regardless of what other people think. Sagittarius is a born adventurer, and loves solo travel and exploration. Sagittarius also loves exploring the inner workings of their minds, and love stretching their horizons through a good book or movie."},

  {sign: "Capricorn", character: "Goat", traits: "Detail-Oriented, Intelligent, Hardworking", date_start: "12/22", date_end: "1/19", color: "dark blue", element: "Earth", polarity: "Negative", description: "Smart, hardworking, and fully in control of their destiny, a Capricorn will always get what they set their mind to, in both personal and professional life—no excuses. Capricorns may get a reputation as stubborn, but they simply know what they want, and also know how they wish other people would behave."},

  {sign: "Aquarius", character: "Water Bearer", traits: "Deep, Imaginative, Uncompromising", date_start: "1/20", date_end: "2/18", color: "turquoise", element: "Air", polarity: "Positive", description: "Aquarians present themselves in one of two ways. One on hand, you'll see someone who is shy, and quiet. On the other, an Aquarian can be boisterous, eccentric, and energetic. Both are deep thinkers with a love of helping others. Highly intellectual, this is a sign of fierce independence that prizes intuition tempered with logic. Both personality types have an uncanny ability to see both sides of an argument without prejudice, making them excellent problem-solvers. While very much attuned to the energies around them, Aquarians have a deep need to take time out alone and away to rejuvenate themselves. The keyword for this sign is imagination. The Aquarian can see a world of possibilities even when there appears to be none."},

  {sign: "Pisces", character: "Fish", traits: "Intuitive, Compassionate, Artistic", date_start: "2/19", date_end: "3/20", color: "sea green", element: "Water", polarity: "Negative", description: "'Understanding' is a most appropriate keyword for this gentle, affectionate sign. Easygoing and generally accepting of others around them, Pisceans are often found in the company of a variety of different personalities. Their willingness to give of themselves emotionally lends to an aura of quiet empathy. A Pisces is comforting to be around. While not likely to be the leader, this sign's presence is strong and vibrant in any cause they put their hearts into."}
]

signs.each {|sign| Astro.create(sign)}

50.times do
  user = User.create(
    name: Faker::Name.name,
    bithdate: Faker::Date.between(50.years.ago, 18.years.ago)
  )
  
  user.update(
    email: Faker::Internet.free_email(user.name),
    email: Faker::Internet.username(user.name, %w(. _ -))
  )
end

score_chart = {
  aries: {
    aries: 60,
    taurus: 65,
    gemini: 65,
    cancer: 65,
    leo: 90,
    virgo: 45,
    libra: 70,
    scorpio: 80,
    sagittarius: 90,
    capricorn: 50,
    aquarius: 55,
    pisces: 65
  },
  taurus: {
    aries: 60,
    taurus: 70,
    gemini: 70,
    cancer: 80,
    leo: 70,
    virgo: 90,
    libra: 75,
    scorpio: 85,
    sagittarius: 50,
    capricorn: 95,
    aquarius: 80,
    pisces: 85
  },
  gemini: {
    aries: 70,
    taurus: 70,
    gemini: 75,
    cancer: 60,
    leo: 80,
    virgo: 75,
    libra: 90,
    scorpio: 60,
    sagittarius: 75,
    capricorn: 50,
    aquarius: 90,
    pisces: 50
  },
  cancer: {
    aries: 65,
    taurus: 80,
    gemini: 60,
    cancer: 75,
    leo: 70,
    virgo: 75,
    libra: 60,
    scorpio: 95,
    sagittarius: 55,
    capricorn: 45,
    aquarius: 70,
    pisces: 90
  },
  leo: {
    aries: 90,
    taurus: 70,
    gemini: 80,
    cancer: 70,
    leo: 85,
    virgo: 75,
    libra: 65,
    scorpio: 75,
    sagittarius: 95,
    capricorn: 45,
    aquarius: 70,
    pisces: 75
  },
  virgo: {
    aries: 45,
    taurus: 90,
    gemini: 75,
    cancer: 75,
    leo: 75,
    virgo: 70,
    libra: 80,
    scorpio: 85,
    sagittarius: 70,
    capricorn: 95,
    aquarius: 50,
    pisces: 70
  },
  libra: {
    aries: 70,
    taurus: 75,
    gemini: 90,
    cancer: 60,
    leo: 65,
    virgo: 80,
    libra: 80,
    scorpio: 85,
    sagittarius: 80,
    capricorn: 85,
    aquarius: 95,
    pisces: 50
  },
  scorpio: {
    aries: 80,
    taurus: 85,
    gemini: 60,
    cancer: 95,
    leo: 75,
    virgo: 85,
    libra: 85,
    scorpio: 90,
    sagittarius: 80,
    capricorn: 65,
    aquarius: 60,
    pisces: 95
  },
  sagittarius: {
    aries: 90,
    taurus: 50,
    gemini: 75,
    cancer: 55,
    leo: 95,
    virgo: 70,
    libra: 80,
    scorpio: 85,
    sagittarius: 85,
    capricorn: 55,
    aquarius: 60,
    pisces: 75
  },
  capricorn: {
    aries: 50,
    taurus: 95,
    gemini: 50,
    cancer: 45,
    leo: 45,
    virgo: 95,
    libra: 85,
    scorpio: 65,
    sagittarius: 55,
    capricorn: 85,
    aquarius: 70,
    pisces: 85
  },
  aquarius: {
    aries: 55,
    taurus: 80,
    gemini: 90,
    cancer: 70,
    leo: 70,
    virgo: 50,
    libra: 95,
    scorpio: 60,
    sagittarius: 60,
    capricorn: 70,
    aquarius: 80,
    pisces: 55
  },
  pisces: {
    aries: 65,
    taurus: 85,
    gemini: 50,
    cancer: 90,
    leo: 75,
    virgo: 70,
    libra: 50,
    scorpio: 95,
    sagittarius: 75,
    capricorn: 85,
    aquarius: 55,
    pisces: 80
  }
}

score_chart.each do |key, scores|
  sign1 = Sign.find_by(sign: key.to_s.capitalize)
  scores.each do |key2, score|
    sign2 = Sign.find_by(sign: key2.to_s.capitalize)
    Compatability.create(sign1: sign1, sign2: sign2, score: score)
  end
end