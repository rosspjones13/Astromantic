require 'rails_helper'
require 'pry'

RSpec.describe User, type: :model do
  before do
    capricorn = Astro.create(sign: "Capricorn", date_start: "12/22", date_end: "01/19", color: "Green")
    sagittarius = Astro.create(sign: "Sagittarius", date_start: "11/22", date_end: "12/21", color: "Light Blue")
    leo = Astro.create(sign: "Leo", date_start: "07/23", date_end: "08/22", color: "Gold")

    Compatability.create(astro1: leo, astro2: sagittarius, score: 95)
    Compatability.create(astro1: leo, astro2: leo, score: 85)
    Compatability.create(astro1: leo, astro2: capricorn, score: 45)
  end

  let(:valid_attrs) do
    {
      name: "John Doe",
      email: "john@doe.com",
      username: "john_doe",
      birthday: DateTime.parse('1980/01/01'),
      password: "password"
    }
  end

  let!(:user) { User.create(valid_attrs) }
  let(:missing_attrs) { User.new(valid_attrs.except(:name, :email)) }
  let(:invalid_email) { User.new(valid_attrs.merge(email: "bad")) }
  let(:invalid_username) { User.new(valid_attrs.merge(username: "bad username")) }
  let(:duplicate_email) { User.new(valid_attrs.merge(username: "john_doe2")) }
  let(:duplicate_username) { User.new(valid_attrs.merge(email: "john@doe.net")) }
  let(:underage) { User.new(valid_attrs.merge(birthday: DateTime.now)) }

  let(:leo_user) { User.create(name: "Stacy Leo", 
     email: "stacy@leo.com", username: "stacy-leo", 
     birthday: DateTime.parse('1995/07/28'),
     password: "password") }

  it "is valid" do
    expect(user).to be_valid
  end

  it "is invalid when missing attributes" do
    expect(missing_attrs).to be_invalid
  end

  it "requires a valid(ish) email" do
    expect(invalid_email).to be_invalid
  end

  it "requires a unique email" do
    expect(duplicate_email).to be_invalid
  end

  it "requires a valid username" do
    expect(invalid_username).to be_invalid
  end

  it "requires a unique username" do
    expect(duplicate_username).to be_invalid
  end

  it "requires legal age" do
    expect(underage).to be_invalid
  end

  it "finds correct astrological sign" do
    Astro.create(sign: "Capricorn", date_start: "12/22", date_end: "01/19", color: "Green")
    expect(user.find_astrological_sign.sign).to eq("Capricorn")
  end

  describe "matches" do
    let!(:sag_user) { User.create(name: "Linda Sag", 
      email: "linda@sag.com", username: "linda", 
      birthday: DateTime.parse('1989/11/29'),
      password: "password") }
 
    before { leo_user.generate_matches }

    it "include high scores" do
      expect(leo_user.matched_users).to include(sag_user)
    end

    it "does not include low scores" do
      expect(leo_user.matched_users).not_to include(user)
    end

    it "does not include itself" do
      expect(leo_user.matched_users).not_to include(leo_user)
    end
  end
end
