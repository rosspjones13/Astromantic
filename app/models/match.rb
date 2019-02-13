class Match < ActiveRecord::Base
  belongs_to :compatability
  belongs_to :user1, class_name: "User", foreign_key: "user1_id"
  belongs_to :user2, class_name: "User", foreign_key: "user2_id"
  delegate :score, to: :compatability

  alias_attribute :user, :user2  

  delegate :name, :username, :astro_sign, :photo_filename, to: :user, prefix: true
  # delegate :name, :username, :photo_filename, to: :user2, prefix: true

  def score_string
    "#{score}% Match"
  end
end