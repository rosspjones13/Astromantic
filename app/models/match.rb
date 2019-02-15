class Match < ActiveRecord::Base
  belongs_to :compatability
  belongs_to :user1, class_name: "User", foreign_key: "user1_id"
  belongs_to :user2, class_name: "User", foreign_key: "user2_id"
  
  alias_attribute :user, :user2  
  
  delegate :score, to: :compatability
  delegate :name, :username, :age, :astro_sign, to: :user, prefix: true
  delegate :avatar_url, :card_avatar_url, to: :user

  def score_string
    "#{score}% Match"
  end
end